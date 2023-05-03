import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else {return}
        
        self.window = UIWindow(windowScene: windowScene)
        let userController = UINavigationController(rootViewController: FeedViewController())
        //let lentaController = UINavigationController(rootViewController: ProfileViewController())
        let lentaController = UINavigationController(rootViewController: LogInViewController())
        let postController = UINavigationController(rootViewController: PostViewController())
        let tabBarController = UITabBarController()
        
        tabBarController.viewControllers = [
            userController, lentaController, postController
            //userController, postController
        ]
        
        tabBarController.viewControllers?.enumerated().forEach{
            $1.tabBarItem.image = $0 == 0 ? UIImage(systemName: "tray.full") : UIImage(systemName: "tray.full.fill")
        }
        
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

