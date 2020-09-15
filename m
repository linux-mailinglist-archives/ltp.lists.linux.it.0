Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4740326AEE8
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 22:51:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 119C33C2B5C
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 22:51:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A3A583C26A7
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 22:51:52 +0200 (CEST)
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com
 [185.183.30.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A0D67100054F
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 22:51:49 +0200 (CEST)
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FKkHIN027703; Tue, 15 Sep 2020 20:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=S1; bh=9FqMlMLJcM1w6VTRymK9oCz9+Tgl+8kBwYh7+a+OwO4=;
 b=lCeB/ojKFYI83vHPoziwIt2qlG9H2JSDSpd7VfrrpK4Bbhj4rKnBg8kHJ9h5+FqJ9DVJ
 PV4uMofmJgyaE3itLxpUURV4eADhKJufBOT9fWSXYO8GFrWt7ay+UM/mgJDUZ8G3efcS
 EVfUmQTbSBQSS1uQOLhKpjBf+eRvGwyqLJroNhIknxedj9O7WRn4pGL0Re9GIe4ilzPO
 IRdO7PFbBYj22DTjagxvVUwZ195yUWKLqjIQZR8mVN7L7W5opoCjgyD/b14KJeAmHP9Y
 aMbncZWSVe+qiZfPllI4PN3LLwklUGpfSzH1BHOTzndFj4oIMmqwt9F+S+AQ/D45CQ8M jw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by mx08-001d1705.pphosted.com with ESMTP id 33ha1jsnyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Sep 2020 20:51:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnNzZqQLIxaS2ODzK/F9xDBuMV5rhq1022hu+u3MjEFRqlVg+yK/dAR3geH/cK+DeNhJoY1TUR+g91aAKHgaSGJBmV10jGJs+hCNCzb4USXMDUPmqiqK0PmA4oKvHQlLWmSwCOHyPKM8ukicA8GXaggGQQM638m33PjL916son1NSRAoQ+rPlSMG0jUbcfj1pFEf55Yj12sXLUyYTrlkIc0PDGwqkJ1otUrQ8vp6ZUt8tpo4PFcv/K7hb4nvzPIWc8E4k8mFu1t5MFjTC775ASCeDu7DdY4gQFKTPwkS0Vl+c9/rPSQdjrccS9iai6MooUOYG+AWK8W5NzvMNfw16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FqMlMLJcM1w6VTRymK9oCz9+Tgl+8kBwYh7+a+OwO4=;
 b=FMvf0LMzQdMQTaz0/jX/awPkn4baqhz0huyimd6S6XqOZZ6gcFpljAI3U5VXeGOIjJkYv/S06ZWe1bdFZcoeTH4IDd/bRG4NMAUZPbq2uJKxvEhCYdC1v+7JSvqUrrY8qcPVXcyy0Hm05X0sJtu6DMgRBSjBYpSv0wMRsJlB/K1LWRxJ2lNR4iPT7qstklLwxyWVQeZoG1FQndkAwlYBIH9Ll+uyVy/KkRWSnuoJblgpdF81rpOtBvhCBNGl5ifrFJWrJCy20qUcXvGZxaw/W0qfuMg64hLWbI+DbqorOJw5KaRTPPo/gepHnYlu1H2FZESCwFEGe/8PvBB0NbwLfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB0933.namprd13.prod.outlook.com (2603:10b6:903:3e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5; Tue, 15 Sep
 2020 20:51:45 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3%12]) with mapi id 15.20.3391.009; Tue, 15 Sep 2020
 20:51:45 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: ltp-selftest-quick runtest file (was RE: [LTP] LTP release)
Thread-Index: AdaLmqKhHylX96+kQiOlLXoYzEe/Rw==
Date: Tue, 15 Sep 2020 20:51:45 +0000
Message-ID: <CY4PR13MB11752979CBBBBCAD98EC86E0FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4f6b9cba-6d5b-4d60-8379-08d859b9286a
x-ms-traffictypediagnostic: CY4PR13MB0933:
x-microsoft-antispam-prvs: <CY4PR13MB0933325147F3B227E389C518FD200@CY4PR13MB0933.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z/0cOU9tkMFDeEkYV9uExkGMJZfRD5abkUFycAlHbyGuHDK4Ff+IHSG6vhhBXdDS6uc9EenmQX8bof3JTO0Vygy1g9JmibngAC0W+/T73+XygNBXZ6KulejRcCNJ5Re7igLG7RN2Hdh5M7JwhMoBXsRxuSfzLK+kid2yMcjhXQfmhV7Y+qhOK4YqKe5A4EmhjL+SXHKwdYEl8/bMZzcReUMTIodvWpf6r65m03f0K23G3do7b9VEeHzSz/GnsEjSqZjfDXendKVdr4pAfjik/++MznJtRMzicUXoycNfxmZlRukNn9YU6kL0Iii5jivv3MKfR4DuvHsCi3Y368IzlKhFl+6IoxIkJG8VFD5ktmgXdWj1RNLiS12MwTMj9Xsx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(6916009)(76116006)(6506007)(83380400001)(86362001)(53546011)(9686003)(7696005)(478600001)(316002)(8936002)(71200400001)(5660300002)(55016002)(4326008)(66476007)(66446008)(54906003)(66946007)(186003)(33656002)(66556008)(64756008)(8676002)(52536014)(26005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: EMHcsZaoGPbv1+B/I/ht1bGpvpwbFwQFPWAPT/GckRJ9JMT9DLq/D0dADOFZliHtn7LSZIFSmen+hn6EjXlVanWs9AsppaJgzAqmdpZgrw7S7fSobSad4hbgxp+CM7YpuykWlFKEskuYsSFgt2n1EkBYpzSianS/QlCa3Px12RqHeosQ6wL+F5Z3PcNWjX7Ou1Yh4xJreLR4bPt/i6cxRrcKWN6w7l0j4pNy8MNtaj0s436ijK34ivC5U7IhWTMbgwggbkxbwHb7oAhu6z1TzFOEPvrHwfKns+a25f9dUOHnreYO3ruH5/uJOUHEme1/5ZIGFS8Vb7oaX2Y1wLW2konp6u6KfvsaIqA1LNxlfpS9TwvwwgfYqMcxrAFTfKdhbj4W8VHL/wdsYbhSPXJemEvzimXMQwdZgkRchKPfOXgpYWYCG8g0991mGUZgPnYoAARJAKi5T+k9v9VzL3u5Fi5jz9caYSEWA0PF/QFgwsDvx7Q+N2hOV5AtT3z2emw/y7MC43y/TFLuq2OPGPYWcNpNdR9b1P/Nwcwp8o3v8XKtoeoM/NoL0xp/Qg+7eB7vfQb/BTdnWyHabrDiDh13aVAM0nqBbcD1nHOrWZKNF7IH81frpOlFAVaokh1QcBxr9Appa5Zp2V20eiVkZ1aFqA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6b9cba-6d5b-4d60-8379-08d859b9286a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 20:51:45.4256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4EmtUtt2toGzJ+65pTOwvseJMRYKSO9sKxeZQ9I6n8b0hW1dsJVym4FWmP0KPaqOloAJrtHOHqc/d1Q945YEUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB0933
X-Sony-Outbound-GUID: kYkSx99kgihq2yB0CcGf3qWLRM1DBy-e
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_13:2020-09-15,
 2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150158
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] ltp-selftest-quick runtest file (was RE:  LTP release)
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



> -----Original Message-----
> From: Petr Vorel <pvorel@suse.cz>
> Sent: Monday, September 14, 2020 11:28 PM
> To: Bird, Tim <Tim.Bird@sony.com>
> Cc: Cyril Hrubis <chrubis@suse.cz>; ltp@lists.linux.it
> Subject: Re: [LTP] LTP release
> 
> Hi Tim, Cyril,
> 
> > I'm also open to suggestions for possible tests.  I'd like a shell script command
> > to add to the list of binary programs.  Here is what I've chosen so far:
> > access01 access01
> > chdir01 chdir01
> > fork01 fork01
> > time01 time01
> > wait02 wait02
> > write01 write01
> > symlink01 symlink01
> > stat04 symlink01 -T stat04
> > utime01A symlink01 -T utime01
> > rename01A symlink01 -T rename01
> > splice02 seq 1 20 | splice02
> Could we please add at least one network test program?
That sounds good.

> e.g. route tests with netlink also uses shell API and it's really quick (real
> time 0m0,687s):
> route6-change-netlink-dst route-change-netlink-dst.sh -6
This particular one gives me:
...
 route-change-netlink-dst 1 TINFO: running route-change-netlink -c 10000 -6 -p 65535 -d ltp_ns_veth2 -r 'fd00:23:4::1,fd00:23:3::1,fd00:23:2::1,fd00:23:1::1,fd00:23::1,'
tst_test.c:871: CONF: libmnl library and headers are required
route-change-netlink-dst 1 TCONF: not supported configuration

Is there a networking one with less requirements, that is basically guaranteed to work?
 -- Tim

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
