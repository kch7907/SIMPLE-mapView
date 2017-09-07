//
//  ViewController.swift
//  kchDITMAP
//
//  Created by D7703_17 on 2017. 8. 31..
//  Copyright © 2017년 D7703_17. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mymapview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DIT의 위치정보 35.165771, 129.072504
        //응용해보기 1번 시민공원 위치정보 추가 35.168282, 129.057451
        let location = CLLocationCoordinate2DMake(35.165771, 129.072504)
        let location2 = CLLocationCoordinate2DMake(35.168282, 129.057451)
        
        // [Span] = "반경" 앱을 켰을때 그주위 반경 몇m 까지 보여줄지 설정하는것 넓이
        let span = MKCoordinateSpanMake(0.04, 0.04)
        
        // 지도에 보여줄 영역
        let region = MKCoordinateRegionMake(location, span)
        //region을 추가하기전엔 location 과 span에 빨간줄이 그어져있을것이다.
        
        // 지도 (MapView)에 region추가
        mymapview.setRegion(region, animated: true)
        
        
        // PIN (annotation) 원하는 위치에 핀 꼽기
        
        //1번 핀 생성 후 Alt+클릭으로 MKPointAnnotation 을 눌러서
        //어떤것을 상속받고 어떤속성이 있는지 자세히 알아보자
        let anno01 = MKPointAnnotation()
        anno01.coordinate = location
        anno01.title = "동의과학대학교"
        anno01.subtitle = "전문대학교"
        //anno01 (1번핀)에 속성들을 넣어준다
        
        //anno02 (2번핀) 생성 및 속성추가
        let anno02 = MKPointAnnotation()
        anno02.coordinate = location2
        anno02.title = "서면시민공원"
        anno02.subtitle = "포켓스탑이많다"
        
        mymapview.addAnnotation(anno01)
        mymapview.addAnnotation(anno02)
        //anno들을 mymapview에 추가해준다
        mymapview.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
    
        let identifier = "MyPin"
        var annotationView = mymapview.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            annotationView?.canShowCallout = true
            
            if annotation.title! == "서면시민공원"{
            annotationView?.pinTintColor = UIColor.blue
                  let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                  leftIconView.image = UIImage(named: "earth.png")
                  annotationView?.leftCalloutAccessoryView = leftIconView
            }
            if annotation.title! == "동의과학대학교"{
                  let leftIconView2 = UIImageView(frame: CGRect(x:0, y:0, width:50, height:50))
                  leftIconView2.image = UIImage(named: "ditLogo.jpg")
                  annotationView?.leftCalloutAccessoryView = leftIconView2
            }
            
            annotationView?.animatesDrop = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            
            
            
            
        }
        
        else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
      func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
//            let viewAnno = view.annotation
//            
            if (view.annotation?.title)! == "동의과학대학교" {
                  let viewTitle: String = ("고산지대에 있는 호그와트 마법공대")
                  let viewSubTitle: String = ("우거진 숲 탓에 벌레가많다")
                  print("\(viewTitle) \(viewSubTitle)")
                  
                  let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .alert)
                  ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                  present(ac, animated: true, completion: nil)
                  
            }
            
            if (view.annotation?.title)! == "서면시민공원" {
                  let viewTitle: String = ("포켓몬이 지배하는 디지털세계")
                  let viewSubTitle: String = ("다 폰만 보고있다")
                  print("\(viewTitle) \(viewSubTitle)")
                  
                  
                  let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .alert)
                  ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                  present(ac, animated: true, completion: nil)
                  
            }
//            let viewTitle: String = ((viewAnno?.title)!)!
//            let viewSubTitle: String = ((viewAnno?.subtitle)!)!
//            print("\(viewTitle) \(viewSubTitle)")
            
            
      }
    
}

