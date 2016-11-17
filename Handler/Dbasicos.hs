module Handler.Dbasicos where

import Import
import Yesod.Form.Bootstrap3
     
dbasicosForm :: AForm Handler Dbasicos
dbasicosForm = Dbasicos
             <$> areq textField (bfs ("Nro de Documento" :: Text)) Nothing
             <*> areq textField (bfs ("Nombre" :: Text)) Nothing
             <*> areq textField (bfs ("Edad" :: Text)) Nothing
             <*> areq textField (bfs ("Fecha de Nacimiento":: Text)) Nothing
             <*> areq  textField (bfs ("Genero" :: Text)) Nothing
             <*> areq textField (bfs ("Correo" :: Text)) Nothing
             <*> areq textField (bfs ("Tipo"::Text)) Nothing
            
getDbasicosR :: Handler Html
getDbasicosR = do
    (widget, enRctype) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm dbasicosForm
    defaultLayout $ do
        $(widgetFile "Dbasicos/new")


postDbasicosR :: Handler Html
postDbasicosR = do
    ((res,widget), enctype) <- runFormPost $ renderBootstrap3 BootstrapBasicForm dbasicosForm
    case res of
        FormSuccess dbasicos -> do
                dbasicosId <- runDB $ insert dbasicos
                redirect $ DbasicosDetailsR dbasicosId
        _ -> defaultLayout $(widgetFile "Dbasicos/new")
