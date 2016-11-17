module Handler.DbasicosDetails where

import Import

getDbasicosDetailsR :: DbasicosId -> Handler Html
getDbasicosDetailsR dbasicosId = do
    dbasicos <- runDB $ get404 dbasicosId
    defaultLayout $ do
        $(widgetFile "DBasicosDetalles/new")