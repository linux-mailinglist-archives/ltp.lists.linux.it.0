Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EBE3417AB
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 09:44:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E7A723C6023
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 09:44:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 14EA83C2C7B
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 09:44:38 +0100 (CET)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E5952100023A
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 09:44:37 +0100 (CET)
IronPort-SDR: Z97wnYgWpfG+qVyMyKtIh2/T9kGJN1HqVtX11Th/mRcJ1Ix+0i4US20tBv4xna1YtMWzo/cxrT
 7r19S12Elu26tKRj8oMzwvEQ4K79UzTWdpRK+4La5j3th1KPvw+MLxagiqZmBWR36XyZ5hpRU7
 nLHvrN0WLXl66zF11EsC1bPMnunHcLXKrO2KRwDnuNFl7z2jI850B4QuvCW0I9kwODOP6YSPJH
 4iAKiJg7u4J8e0l08UXHsNlAK7T0c0Ja5OJXY9EPpIHFLxCJ3+T+qRg0uLs8yfG6rynlQqH6YM
 Thc=
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="28197835"
X-IronPort-AV: E=Sophos;i="5.81,261,1610377200"; d="scan'208";a="28197835"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 17:44:36 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlV8lsVs30wcQ+nRKPUwR3+xD3hpF5la3R7/kWg0VPxCsFc6qMkD9We43cFI5e8m/4dUqtxnK0aXeTXZJ+4DOE8RBbAZQtA1lpDuXEQ3dQr7FaLGuj8I8vuZOKfDwgFuBhiM3BWwWWiyn9L1WLZEZeUtBmAKetDWSr5jYkiMtc7Sb5QBeCDXjYgKiRmxpX4HC0+FpwfIMxXo4PRol72wvLkLVBz9T+dhZfRPxpUIlWk22ZrjeT0HrBOoNIBT1zIpAt6i7O1GRgtWU68ypfd3MsYToZJosy56pr0ueHJVO7+4djpUi5emE9UcvLfk8lVJGexlSr02CmxsB8S/Qatf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpwT35cOQTq4wkFybbjFGUpVhZvnXhjmyGjBp9+DLUM=;
 b=aGVG2zj6uZmG7zZgRlj622q8GnrC/qM79S3TkYSUWtunXo54EC4uTPots72+x1ukzD+K3qyGJodiLmEdjpOFA1uRnLjuFLNGUE0MUC4wuWHy1nw2mFle2vayrS5NU4MMVr2m+kprxgUZEaVallpuNRo/y5uiXHWUr1Q8gUqOC2i4KWFGGs279c/HaYW+TQze4KNH7fTZpyJyHO4SDbsKF7wiYGYPs6o90oq+yv13PI/WhndGHP+MAAnJ1+BpP77OHDFmdk7ruCmjstN6LaEUD7iB896fIhYn15KUpmVsMC1ug+rAmA2B4MYUnx7XgcWsWzVLxyznvZPlEP4/b/kYeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpwT35cOQTq4wkFybbjFGUpVhZvnXhjmyGjBp9+DLUM=;
 b=l3LFquna2I7VNTyw090HU1Saj4oEa9flsJVLvRlPjnHnZY8uyWYZKp5U+a2XUJ16Jk7yoqtUZpWDKCHyuIs0xUD7XrElAr+s8dasBHO36RlwJihG1MuHYA5xQLkTVrqPem6fh2kmrZihlkNlnsurb0g5Ku51kLBmJ261TxrFht0=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB6336.jpnprd01.prod.outlook.com (2603:1096:400:79::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 08:44:33 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 08:44:33 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/semctl09: Skip libc test if SEM_STAT_ANY
 not defined
Thread-Index: AQHXHBMvw6KPFrT9F0StRNwMpIKz2aqKEVUAgADqauiAAAQ1AA==
Date: Fri, 19 Mar 2021 08:44:33 +0000
Message-ID: <60546464.1090002@fujitsu.com>
References: <20210318162409.9871-1-mdoucha@suse.cz> <YFOcOJP4innlbIk4@pevik>
 <920d81b2-567a-4e28-58f7-b27151b1cad7@163.com> <YFRgzbKPtVBK/l5d@pevik>
In-Reply-To: <YFRgzbKPtVBK/l5d@pevik>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfad92d0-ba1b-4726-1888-08d8eab33863
x-ms-traffictypediagnostic: TYCPR01MB6336:
x-microsoft-antispam-prvs: <TYCPR01MB63369ED2594598844DBBABA0FD689@TYCPR01MB6336.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MHwaZQ5MivF5BeNAHBUh8VWrvEmoZBR6mlm4IKp+upRGxAvynzm0f3i1SuV8VC2P8tKKwGevRMnLkBq6K12uliPKgv1s3vZ4loD3B6Kap0NnKuUkUlAjN+yoI85ThIRMBV30h5LiNmbutz9/lPD3fzGLrw337C6DpOxeyPk7we2BQWmiU8yEPnlD5T2XzPc91CvFKfQSkBOXnXF55NVk4XtFq/IykzqawXZLcbH9I1LhaNK+xY+920foyNa1o18pVB7KO/pvZLp07OjA8/7ctwqCYChR/c0mimljYH9L5a11/9xUPxX15Z/n5sAjFF7HcGsRNIZCvCVf+HoJDN4DE3J4xSJ9DvDR05XHYfpXFjn+I0yI3K+2D76hPSq7e4Uom8hiwe8T0DaYOR5gxA1HNyeuzToe4M+Zwmeloug8eCcGhaF32eEV++yixf9wVMj0/ZxaEePkSBotrLILEXVFl9V08uo0IONF+bx8VxM/C7PAfeLjCt3jtT4wk9lGJv/58yWFDH0LbffSLAct4b5bfa5mzKMz5FyxjlAbeWGWQoKEap2YR+SP31uI9bWRZ1uLbI4A6Fp7oQYZXeL9l6PTHSQqpcw0wackQpWbUpFsIRcbCD8SIVAQmwlFSnJkFfbGEpF69CWW3l5cvvBhGc5m4Ac9boeNwBVKJ42NCVE1kA0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(85182001)(71200400001)(26005)(54906003)(87266011)(478600001)(5660300002)(186003)(86362001)(64756008)(6506007)(8936002)(66946007)(6916009)(91956017)(66556008)(6512007)(66446008)(36756003)(316002)(2616005)(2906002)(6486002)(66476007)(4326008)(8676002)(76116006)(38100700001)(62816006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?MVN3VmphYnN1ZUhoTzg0d2xTK04wWXp0dnNqaTM4ODQyTVRjV3ZndFdrZWxL?=
 =?gb2312?B?RkVCS2doOWdNRFhZVDdCUE95NnFoZkFDNStLb0RFQmNOZ3FBQ0FFOXlSQkE0?=
 =?gb2312?B?dHgxcEdlaWg3MWJWbktLTXZWQWVwUldRcDh1RE84R0pJQXZwU2FGL0FyME83?=
 =?gb2312?B?T2RaNTIwN2ZST2dYZXc5ZXp0N3c2MDlqaTM4ZVdaVjNvWkE1WVpCaUU0YTF4?=
 =?gb2312?B?cmVmVUwrV0x5ZDlCSTYrTUxzN2N3bXVoRWxMR1VjQnQ0dys2VVdEWVBSM2Iz?=
 =?gb2312?B?bUk1V2gxVWJLYmVlQk9rZGN1NVc5TzR2Z2M1RFJNNjZIUkh2NzJPZWNBZmlk?=
 =?gb2312?B?ZWo4aStZVFVYTENQaUdvWWJ1SnEwYis4QytMUUZFaEQ2ZzBiV2pUNjh3b0or?=
 =?gb2312?B?ck9KQTdEREpmeWZtbHZPNEdkdG1kNnEveWc5ZkxmaTlqQUJDR1MwbWRqcFVx?=
 =?gb2312?B?bkMwZGx4aGNyUnU1YndPNzZWTnhKYnJTUlhsN2dsM0hYVGdxUlNNb1ZHTXA4?=
 =?gb2312?B?Y2xpOUFSbk5GZ2V2SlNoZWxWOG5zSTQrMFc0cUZKUXlGNmYzTUFRbEY1WVZx?=
 =?gb2312?B?RDBVM1A5STZXNllVakJuV0oyV1dMNldrcU5OU3JBRkFYd09YTVhRemNDc2Ev?=
 =?gb2312?B?VS9EaEk1WmM3R0ZMdW5NbklhSnQ0V1c3UllBMVRvV1U1bFBJdXNvY1hUd21l?=
 =?gb2312?B?ZnBrTkg1bU5kT0R0VldaSW0vZFl1YWVjajRBMFRDSDBmVHJRdkFqVStPbFRl?=
 =?gb2312?B?YlJaZy9pQmtUTkRKaEJaelZNZDA4c2VKZktYQ3B3c0NlLzh3UXlZTm9MUWJp?=
 =?gb2312?B?Q2xLVGMxOU9FTzFuSFhwdlMrYlRQWmdKd1FDcGd1TW1LQU9KUEFsTlEzL2xX?=
 =?gb2312?B?YXBYbzZ3Ylg5NnY3eE90T2d5N1d4d3BlV3U1ZWJvTXR2bi9mQ3cwZ0hJUkxO?=
 =?gb2312?B?NWp2VXBaVkNmbVNFeFhTbXlQOGxEMW5TSnhQcWVacDdWUmdXeklMejEveXM2?=
 =?gb2312?B?SEdqWDlSMnlJUitLTElzVlVaYVN4WCtpZUdsU09vUWNVZUF2VFhOOE9FQm1V?=
 =?gb2312?B?UnF3cGNlZnltby9kTHlFb25Qd0FkZzhGMzdEZFVkc04wN0djVHY2Tm95TjNY?=
 =?gb2312?B?YmNNbXNXamNRWFlxbEZkQWdOalZkQUtpUnBwczFIVWNBR25NTXdkaUlkdmFU?=
 =?gb2312?B?SVFTWUs5clBRNkxOYkVnbUpMTThFR0NMZ05FeDBHdlE4SXVkR0l4VWJuS0tP?=
 =?gb2312?B?U01uNE13NzFndEd6dVdpTWw5Mi9ISFVFWXhWcGdnQ2tIak4vZDg2Um84K3ZB?=
 =?gb2312?B?SkNzb1JIcWllYllpYmw0akY2MEN4MUpFaGVZRjlHKzVnZjYrRmRGRTFNVWlk?=
 =?gb2312?B?cjJDMHZIOW8yNVc4NGFqQWk2ZHVHNVY0RXJVcUFYWVN6aW9yd3pYTjgzNzNR?=
 =?gb2312?B?QlFyS3Y0RzNoUUpVQkJIZzlXanUyWGQydW4xUFVKclk2OVVmTmYyYzVjZ25n?=
 =?gb2312?B?UVhHcU9sLzRZdU5NU2ZKNU5JZXVnRW9jblJ0dVR3c2VudWRBbDNDM2VIc0J2?=
 =?gb2312?B?ZklVWWNxMGpSMDNxYWtpck1tY2hHN2hOU1VvanVRZWhiTWtOVEYxNEVmR25p?=
 =?gb2312?B?WU1ybmJKQlNNalFUR05BTDRWM3d2N0Q4SVRjUlBlZ3FyVWcxa2ZZOEpmcjZx?=
 =?gb2312?B?THR6anFsZklhVXR0bFVmNXJLT3A3ayt1VXJPQXpHREZJTVpqU21TNWhBNFMz?=
 =?gb2312?Q?p6H4Z1I9SkTybMpiyIPYgjV0fOVC6FAvsD+mLwL?=
x-ms-exchange-transport-forked: True
Content-ID: <25E4B7F2B14578419E7CDC1D4EEE85D6@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfad92d0-ba1b-4726-1888-08d8eab33863
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 08:44:33.7874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ciP0qGoAXZSKBg80NTn8dP8boxS0Lcl6AFbFSCErNW0V4lDlYQ6TYgZV8hufqGYumnVYyTXmRrd8UsMtkXwq6/K2sZcJuavO/4sPKpGBixA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6336
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/semctl09: Skip libc test if SEM_STAT_ANY
 not defined
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

Hi Petr
> Hi Xu,
>
>>>> +	if (tst_variant == 1)
>>>> +		tst_brk(TCONF, "libc does not support semctl(SEM_STAT_ANY)");
>>>> +#endif
>>> Although I understand why you want to quit only tests with root
>>> (only these fail), it's a bit confusing to test with user nobody
>>> and then quit the same testing with root.
>
>> I don't get this.  Martin only wants to skip libc test when undefined and it
>> doesn't matter which user we use.
>
> if (tst_variant == 1)
> 	tst_brk(TCONF, "libc does not support semctl(SEM_STAT_ANY)");
>
> means:
>
> # /semctl09
> tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
> semctl09.c:76: TINFO: Test SYS_semctl syscall
> semctl09.c:141: TINFO: Test SEM_STAT_ANY with nobody user
> semctl09.c:163: TPASS: SEM_INFO returned valid index 19 to semid 19
> semctl09.c:173: TPASS: Counted used = 1
> semctl09.c:121: TPASS: semset_cnt = 1
> semctl09.c:128: TPASS: sen_cnt = 2
> semctl09.c:141: TINFO: Test SEM_STAT_ANY with root user
> semctl09.c:163: TPASS: SEM_INFO returned valid index 19 to semid 19
> semctl09.c:173: TPASS: Counted used = 1
> semctl09.c:121: TPASS: semset_cnt = 1
> semctl09.c:128: TPASS: sen_cnt = 2
> tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
> semctl09.c:191: TCONF: libc does not support semctl(SEM_STAT_ANY)
>
> i.e. run first test with user nobody and skip the second.
> It's a bit confusing to test anything with SEM_STAT_ANY and then state
> TCONF: libc does not support semctl(SEM_STAT_ANY) :)
Thanks. I got it.
I guess we can move this check into test_info as below:

--- a/testcases/kernel/syscalls/ipc/semctl/semctl09.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
@@ -77,6 +77,9 @@ static void test_info(void)
         break;
         case 1:
                 tst_res(TINFO, "Test libc semctl()");
+#ifndef HAVE_DECL_SEM_STAT_ANY
+               tst_brk(TCONF, "libc does not support 
semctl(SEM_STAT_ANY)");
+#endif
         break;

Then output as below:
# ./semctl09
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
semctl09.c:76: TINFO: Test SYS_semctl syscall
semctl09.c:144: TINFO: Test SEM_STAT_ANY with nobody user
semctl09.c:167: TPASS: SEM_INFO returned valid index 34 to semid 34
semctl09.c:176: TPASS: Counted used = 1
semctl09.c:124: TPASS: semset_cnt = 1
semctl09.c:131: TPASS: sen_cnt = 2
semctl09.c:144: TINFO: Test SEM_STAT_ANY with root user
semctl09.c:167: TPASS: SEM_INFO returned valid index 34 to semid 34
semctl09.c:176: TPASS: Counted used = 1
semctl09.c:124: TPASS: semset_cnt = 1
semctl09.c:131: TPASS: sen_cnt = 2
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
semctl09.c:79: TINFO: Test libc semctl()
semctl09.c:81: TCONF: libc does not support semctl(SEM_STAT_ANY)


>
> Kind regards,
> Petr
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
