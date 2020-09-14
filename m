Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A49542698CE
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 00:31:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 647953C4F25
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 00:31:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 17AB13C2B75
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 00:30:59 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CB232100078C
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 00:30:57 +0200 (CEST)
Received: from pps.filterd (m0209325.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08EMUut5008833; Mon, 14 Sep 2020 22:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=HIXdzJUeP/e3PJvb2Iqp8DIRJkoWxjg/N4499lIJhZE=;
 b=lsJH1w/0Q3TX3zdZP35U3GaE0ujiQ/OFQAnHMAZPgRW4yDSLEhUCugM193TckNgrEg85
 rPCrb90a2FfQf7CatGSxc7mhqMDpTlgmxvr4FqGln4f1ZKSomzADcJ1SAtgR3ehQ5she
 OG5AxSDzrbQKwpJl9fDKp9F0nTh78QCgneHJAsWHhdFJcY/k7jy0wucgzE5uSNjUiNGB
 YO+j/PItugjmXV+ubdsfPaahBk+JwxSe+gHGiZcPSjebEXfveSTfHpdFLk4Q27+pgfEg
 AaIop4bGz0b0qqo7gM6w1LRYLhTynEEQC0X68OWCl9nZA8j4z5lb7ND+bFBLZp7PVSQw Rg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx08-001d1705.pphosted.com with ESMTP id 33gy6h94x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Sep 2020 22:30:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5JhWgPLH8U2gFUmN3XB9ADm4sQUotFC4ScwYSjvNzqzGDrgPPqqK8kTxdWHh4i84izd8gX3mhQY2WSchpREj4yeVm9K1s6qChoXLblFrPG4EeJCqiY7k7sLoeNqLQ7U8Ys027w+4FA05DTm4kLQzdP2eL8NKTmWTQHZlv7QkuXYy8VxxehB27AOIsqrm6Xb/OiSDlZX0vFo92ZRWKzJs6cp4AtU1OrHayMB+11rs8mIyCYQmMxdJc+wK2q1EckiWluqvF31aD8WV1ETjjMGtEVPPLBTYPxjfs6tW8D9TAr9zH3Fkd+cFPb00Tn+dSnUcbvIiZ1xD2/6vRJceOoFWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIXdzJUeP/e3PJvb2Iqp8DIRJkoWxjg/N4499lIJhZE=;
 b=ZhCOAV1Sm2ERBoNHRHOUN1ARKTO3C9xIUsyIeJyuZEpgr8f1PzLwwXw9LPXKEnz31aMV4WzAa91VotTSL/dWW2EYyAOt4DbKbf/diU0kuR/+RkFRyxmJlxUF5XfanJdi8MW91WBfZXZQ0XRB0KbPVOGJKhg03FN8riJ/7DRAKRzjGte0CM187EMRyUpfpHMrAuJBeeBeayd1dmaEMC5/RxjinENqEYaiwH+55N9OeSsI5PaXY3hXvOtZV9Oj8HXkc1vmHGTUB9hMkxwMGVJMvHaBDadShHWFa59znoljbUnLRPfX5RjoWFxReU37GJT898XPwVFoOMZfqOLkwHnqiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB1383.namprd13.prod.outlook.com (2603:10b6:903:9d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.7; Mon, 14 Sep
 2020 22:30:36 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3%12]) with mapi id 15.20.3391.009; Mon, 14 Sep 2020
 22:30:35 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] LTP release
Thread-Index: AQHWhbIQCGbLXijA4EiknupaabeIZqlhkjIAgAZzL4CAAKzBoA==
Date: Mon, 14 Sep 2020 22:30:35 +0000
Message-ID: <CY4PR13MB117529F882F68FED2C60AD09FD230@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <20200908073138.GB2475@yuki.lan> <20200910084554.GA21741@dell5510>
 <20200914111543.GE5524@yuki.lan>
In-Reply-To: <20200914111543.GE5524@yuki.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 05815584-68e0-4a83-5321-08d858fdcccb
x-ms-traffictypediagnostic: CY4PR13MB1383:
x-microsoft-antispam-prvs: <CY4PR13MB1383CFE97A4E637C610B7F89FD230@CY4PR13MB1383.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nQxqWAuA/z4dZdO/Ub1teSAo9+trP7QozW5xNXQiJD27c6tF5qy5i3E9a9a6f7lq1ltu0OQ01CKLl9FMiIzSl5O5GswiLGGrU9f2bYep1T9sL16p1hVCQMjggWS53KozxMDl1i2KgxaKJPySwX5E8X6uUG4W4jdGWq4+z7bxsg6/wJAjXnXlJmEIET8s6bXKDmXF+KJd+Y7kGpTp6wKJ7bR5mtWNiJnv2c/Iou0UzWlh70HxZN3QOSbCJf4DQ+4O4XUca83JYdKSwmzWZpnhWIhOwkudQDDyw8YbVtJDZs+s4jVy7zi1c44NlcxLW6UW7pysR00dHxWx1Qz4UctpS1EeZPbhqJtez6IC8l5hKvEhyj8BgF5kCinibc+Kv5Fg7L1S1BAk5pLBmdjc2Uo4wA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(966005)(66446008)(5660300002)(7696005)(4326008)(33656002)(186003)(508600001)(26005)(316002)(9686003)(2906002)(8936002)(6506007)(52536014)(66946007)(66476007)(66556008)(64756008)(110136005)(71200400001)(86362001)(55016002)(76116006)(8676002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 6H9ZxME+PVjQ0rKMg9/Apc1e9Qe21BCR4rMfpnuJ4Hq2bYl+SmCSn7xwjRe9fo+tI4X+ou6abivQdAB9Lt/k7VK2YL+FyeXNyRUBGP5CCJKMH96CBUAKNRgHQSORgJayREYreo/n5pt/+9rMXkKWmTuLVkoJrAYF9mCkE2X+dMzhdcHEDLsmGm73C5HWt1IAgaJbXCUui8/WW1hPxUvyfRiVEzu6AaUKA5GGu7Evr+QVfzrXxtiWNlm1C8WIRTE3eip0SpMBJfzLUZtOs1GA4rEe6zWckhRGKt8/BH1Rp9zvY+hj2cGGx4I6BTQTKrOnIP9NCl1yvdgFEMyQZTudC96mEHVML1yF5bdYr+7iANK/LAEkEKST2ZlMnXRHDDc2nzhY4NpRvo75HunKDHU32fAec4bAh4XcpekPV0SUvpvKPI6xcD/jp3FMEHtGQp7uJ5N9fdNDMBM0S5Z3eatItTzLzqEtFKaepDrb1rHg7fqzsfrOXsV5XNMQpsnAqut9t7AKCj7l0+YpUJtOR94B4jt88eI1HHOyhCOniDrB7LE030FO6pVCaM/b8x+hjkGTuv3rMyOtsct3dl2ZL5+7EnCrlBIyq+Rh9jim5XFVLmkVCq4N7wSMHFvpvbODZ8GVIhybnvBGz3uC4zlD7kK1lQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05815584-68e0-4a83-5321-08d858fdcccb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 22:30:35.7273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+163/ITMBvvHJOWGqWoMbRiGn10vKRFolnfeT755p9cD4iUxlMcdAzcp5ZcMsMF2JLiL20Mdb5q+DySluYEXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB1383
X-Sony-Outbound-GUID: rlkAItUOuWUsn62KJ0aOdE7DsKOnVLtL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-14_09:2020-09-14,
 2020-09-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009140170
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
> From: Cyril Hrubis <chrubis@suse.cz>
> 
> Hi!
> > > What else should go in?
> > How about removing runtest/quickhit?
> > https://patchwork.ozlabs.org/project/ltp/patch/20200831094617.7764-1-chrubis@suse.cz/
> 
> I guess that we can do that if we replace it with something Tim can use
> for infrastructure tests.
> 
> Tim what are your expectation from such runtest file? How many tests
> should be in?

I don't think that it should be very many.  Otherwise, people will get
the idea that it is useful for actual device testing. ;-)

The current 'quickhit' runtest file has 107 tests.  With the exception of
qmm01 (which calls mmap001 with '-n 1') and a bunch of tests that do sub-tests
of symlink01 (12 of them), the remaining test definitions
just consist of the test name and the test executable (with the same names).
I only see binary programs - no tests using shell scripts.  So there's really not much variety
here.

Apparently a pipe is allowed in the command invocation line for a test, but there's only
one example of this in all of the runtests, in syscalls:
splice02 seq 1 2000 | splice02

Really, as an infrastructure test, I only need to run a few testcases to validate that Fuego's
plumbing around runltp (and ltp-pan) works properly.  And it would be nice if
the run was very short, so I could do the check quickly.

Do you want me to create a runtest for a framework/LTP integration test, by picking a
few different "representative" tests, as a replacement for quickhit?

IMHO, the selected tests should behave the same on all possible systems, to avoid
getting results that are inconsistent due to the system under test, rather than a
problem with the integration between the framework and LTP.

Should I add some outlier cases:
 - something that times out
 - something that always fails
 - tests that return TBROK, TCONF, TWARN, etc.
 - something where the command doesn't exist

This would be helpful for checking that my parsing for different results works.

Do you have a preferred name for the runtest file?  My proposal, just off the top
of my head, is: "ltp-selftest-quick", but I'm open to other suggestions.

I'm also open to suggestions for possible tests.  I'd like a shell script command
to add to the list of binary programs.  Here is what I've chosen so far:
access01 access01
chdir01 chdir01
fork01 fork01
time01 time01
wait02 wait02
write01 write01
symlink01 symlink01
stat04 symlink01 -T stat04
utime01A symlink01 -T utime01
rename01A symlink01 -T rename01
splice02 seq 1 20 | splice02

This takes about 5 seconds on one of my test machines.

 -- Tim

P.S. Maybe, if you're moving away from runltp and ltp-pan, it's a little late to be
adding some selftests to make sure they work correctly.  But Fuego is using them.
I don't know what other frameworks use when they invoke LTP to perform
tests.

P.P.S How come some tests produce TPASS and some produce just PASS?





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
