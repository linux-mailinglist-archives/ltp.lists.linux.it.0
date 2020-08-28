Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA3D255DFC
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 17:38:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C7A73C2E4A
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 17:38:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4E0BB3C25A9
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 17:38:00 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7D1F820007D
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 17:37:57 +0200 (CEST)
Received: from pps.filterd (m0209325.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07SFYSkn018434; Fri, 28 Aug 2020 15:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=e6XeISeAVq0zTcUr1l/L44zseimiS5bMmx8FeFqOCD8=;
 b=jDKKKxOq5CeCZwagUkyjFrvBt672IMc1kSCQ9V3gMm0RShhNKMxb1z+HO24kKp+g+vpu
 Wc3ZClv026pZ2s8fTKKcSNTfn1JWOJhxdaufOjL+PP+wmeUTPPvRJJteqUEvKV9BNeMB
 miN0pUsUWTiPlz5jQoCj0P3n1HcSzJAjgC4q74YiI9uVKbD7RHlbpRM4h4l5O5FbE2My
 pPR7+O1knlh2nC7KkA5NY/4KSBjxoBhwFsA6YHZhgN9J7s5vqZAk5fWhTlQhIJqh7mEa
 p2xcNZ14yVZLsLtP1EfZDYfLdkwgdW1ccky+bGfo/J8lMkSBA0WqdgKRqFga7Je3fUIG qA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx08-001d1705.pphosted.com with ESMTP id 332uk7uywt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Aug 2020 15:37:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eO2VTmIWFo4QYkKB0H0fYF+MpMYie256h64RN3h8wVvHdq9m22rVZDDyELTYHVFS/RQ+o3vlys1noclMo66r7nlCH00zJvc4MNbiLfHpZh5rG+dch9relx3SS6ipuOIqb41B8UL/WK8BNfnE7ybx3S8YgQCR3QuAN3GsCIW9m/79M4wCW43VaVlbl7yLQ2W0Nn/GtnNJOf4SPBTfuC4RfTLb/aXB3TI5N5JQonzwkjGcI3OCdRcGNNgZJ/wCka6ElLTm3M8Ry8rfOk1qn0b5tuH0tANUkxJKhHheoY0ssNhjaSGtA+z5AfxkTL9O6mV3IAwM1dzwtjGKfnhy2cfR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6XeISeAVq0zTcUr1l/L44zseimiS5bMmx8FeFqOCD8=;
 b=XllN6UfornSHULfQELe+g50CYauxm14fX1b7/quzN6cRMdSNW1VwmR2yGJxshtGBLWE97mJdYthEWyYsm0w4fZ4yDJOErq5kk5o6jI3pcWLjsmr6wFFK3pOil3eSPMheFjXuXGLnlWdhrWjUVDmcK0qYzHmeM9jJ9yEXBEmQGtBdZyv6WPngEHlNwHdRg3zL6pkqqAAsrgCSc/hbiEzjX3u5iziKktrF0jEl0IZrUeriHwFcT7UWaIlqn5zNKAFnjn2j81pOOsXbnvhjT4JD9DREMxhUlncF0N2Lu4I88jt1fcYOBc66KCUJD02etT0brWNMVVcTT+RYyIXpS4/25Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB1717.namprd13.prod.outlook.com (2603:10b6:903:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10; Fri, 28 Aug
 2020 15:37:53 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::5c0c:3d3a:c493:efa]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::5c0c:3d3a:c493:efa%11]) with mapi id 15.20.3348.005; Fri, 28 Aug 2020
 15:37:52 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Cyril Hrubis <chrubis@suse.cz>, Cixi Geng <gengcixi@gmail.com>
Thread-Topic: [LTP] [RFC] ltp test add reboot function
Thread-Index: AQHWfTwJrXyUoa07s0uKrksDE2kaNqlNpkbg
Date: Fri, 28 Aug 2020 15:37:52 +0000
Message-ID: <CY4PR13MB11754F0072967B32B007D273FD520@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
 <20200824074226.GB2466@yuki.lan>
 <CAF12kFvScxqxhY5wXTGL2RKnyM5vM0hEKDc+sHD-3Y=_C7FWcw@mail.gmail.com>
 <20200828130638.GD10501@yuki.lan>
In-Reply-To: <20200828130638.GD10501@yuki.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8f37dcc2-8c36-4d0a-050d-08d84b6853ea
x-ms-traffictypediagnostic: CY4PR13MB1717:
x-microsoft-antispam-prvs: <CY4PR13MB171763566D362A3C131A1B9DFD520@CY4PR13MB1717.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pwq2NQ7OcAZCh7nPdcbiqgsVTZe+fL+oa8PCdsduqlgOfIak3/V/DHEj5UH7YzWI1NcxMJBT0/gs3DLWXWgxHLgigowZV8rOLTzAOtuoYn4qhovcnGArGWG5Dz4bTxy6wk+alhoiXC1jfGQD0zJ70fTG1Ae9CD+JPG1li8xUxzak6cyYpI7n+X0i4taW+6bvkW/1sCaGwqScBXyhNGmdOnMSjXx2jbU3Bc8sv+hO7Rf3o+b3Sm1Jr3kmu7/oLUKSOMXn7Zv2Vvi/124mPm4I5hiAegeNursAucjG5/nqPnJ8lxM5Eg01SOsh4AdgvrcNBhEBZiMVhj32To7JfCL8Cg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(71200400001)(6506007)(186003)(55016002)(86362001)(33656002)(7696005)(2906002)(9686003)(4326008)(110136005)(52536014)(66446008)(66476007)(64756008)(66946007)(26005)(316002)(66556008)(76116006)(83380400001)(8676002)(5660300002)(54906003)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: P4F7Hb919s2JnS56AuyWhKGziq9lGGYFIABKNN3D9Rs1zKkRnQop4kiliGzw/L/yBCX96Yab6wpKlTl2k4tfuQ9Gc8+UJcMut8hanuYRtAyMl6PHzb0dkNMbNTZjqbEy8m6dwveaD814FtBdlqEe32whmU0mczE+T1Oz01wBB7nPt/BpVAOWFouAzgHzfppbK9LEzYASBh6Yx2wZD+Unj/kjTHYY30OVNM+D0RlaVt5aNtCoPTl/P8+135JcbGUivxqwDPYDOBsZW4jajgK90frl9I93DIufmelMcOf5+6DdsM4JYuoQkNGg6RSqVzuP6RuqMjd5E1CGmOn2lM4S8GFPO02j4gBq4MuO17a0SmzAA9+sCoAHEmCDu4igiy9o4AINqpFlf0p9Hql4ZS42mfMSlOhOzPjeic3S4b2WZWca29jUCPp6GmXerwIZwwf+FrChnacDcXxUM6nOBykPkgHzF+oyJkdQ3wwRT43v4QZ9bchaHVvyXTOJdlixnTUlYwNE6SBoC3Z6UJPAWmCxE1kxlXRlQ1h6ikRuDiLCwety04D8HcEFczk0yqS33zmLr86PJzL9mDHe2sj7nn1imb7cNyIp9RCmVfJG6ZrsMVG+XLlrPiZcSVrb+PwTJiPY7pS36a37RurR6giJdt+2dA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f37dcc2-8c36-4d0a-050d-08d84b6853ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 15:37:52.8493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OX5g5j0SccP0PJaTayOAm4eeOyllLIlyzRKMeP14cdsEk+8ae2wSp2cMbt7zXtnOXLpVrVWyQCs4dX2BSVTD9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB1717
X-Sony-Outbound-GUID: P_Jy31LBLpthqVr9WOLuVvTOrMoBwX8y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_09:2020-08-28,
 2020-08-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008280118
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC] ltp test add reboot function
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Orson Zhai <orsonzhai@gmail.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



> -----Original Message-----
> From:  Cyril Hrubis
> 
> Hi!
> > Thanks for you experiences on the reboot???
> > So far my opinion is add a reboot service by chkconfig or something like that.
> > the service will start runltp scripts from last break off point.
> > when the tst_test have .tst_needs_reboot =1 flag, it wil strore the
> > run status and
> > reboot the machine before run the test case.
> > Now I want to know what needs to be preserved???
> 
> The runltp script and ltp-pan cannot save and restore a testrun,
> although something like that may be possible to implement, I doubt that
> it could be easily added to the current infrastructure. Not to mention
> that ltp-pan has been in a maintenance mode (which means no new
> features) for years now.
> 
> Also I do consider the whole concept of running the test exectution
> framework on the same machine as the testcases broken by desing for
> kernel related tests. The way forward is the patchset send by Richard
> that implements simple test executor that runs on the machine under test
> and communicates with a execution framework that runs on a central
> server.

I don't have anything to contribute to the primary discussion topic,
but I just have to chime in here that it's very nice to hear someone
else express this idea.  Fuego's architecture is built on having the test
execution driven from a machine external to the machine under test.
To me, having the machine under test drive its own test execution seems weird,
in that it requires the machine to potentially perform actions (like reboot,
or saving panic data), that require operational fitness - which is the very thing
being tested.

Sorry - just had to vent a little.  I "preach" this a lot, and it's nice to the same
opinion from someone else.
 -- Tim


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
