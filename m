Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1908D165DD7
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 13:49:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8326B3C25AB
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 13:49:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7B6413C088F
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 13:49:16 +0100 (CET)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380108.outbound.protection.outlook.com [40.107.138.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 882A1100205E
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 13:47:45 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6XiM98m8cQ8ak8jITGFPTYnQtSDnlUUWQWP2M5XOf1g0fJb+FaRzoWCMBMZ08fO3khOjcVmhG4gD9iiXoTwkxPlx7OcFWnwEp6babTxAaGJif99L68FENjrNFytpU3kGMzfE3XsDlcr1hsNAPkrJ/TGSv/5sEGEJSwhMdYiZkHc6g84hWeG70+HYsSOzwi5t4ePcS8xyNpVDPG9UMpVtuKgnN22RNQMeNK8D6XeJsD+Hdpa9YeUTFaEVe8JYHBa8hmOvUDQD2y9O4NaXcmzw13Vt28tb0VLOfg7rubG+hoRX3k+LnS15TXlXB/HD/tgo8RT+6j6Ivq9doXQbBYeNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQF01qLQRbSaMGP1q6epqgwjsuqWu76G/pLtARY7xOQ=;
 b=aUnC1ZPqUo7c6ZZwhIGvzJtCJsvg7ZVbU5FmbkDj48KyWxqLNg4yqt9juorLLiQUtgufHwC8+MwZhKbYV/bNFp8vNBpE149KhEoulX98Qu44d3QsRqk6ngJLLaR9W2mwJkjNtwgWg4nNFkQ9Gn7/QWsgXK4TIicsbGMIjhp2j963kjCME7nWjd4MhHLHkzLMS540T3OyWNSKhXk/w+VAaBi6r+2iGCDQMblxeCr1YtbvtbfJgsLgu+wmR2WyOL1QWxFPJpttTeCXy6ACguY5k4+U85wzxXhiuZi41nM7n4pxivj4vKZ/boQaDMJupEDppBSTZIZ+ibCshT6ucP/MGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQF01qLQRbSaMGP1q6epqgwjsuqWu76G/pLtARY7xOQ=;
 b=CozXuJeXsjvNhtopKo/oPxMUZjh/8u/a/tbSFsM/gJsm+x9bzIoFK14RJGLkLfqvN13vDtWbjmjV5zE+k8zK3lD92IADEbYXi1H8QHJzOVq/oJTzRpA8xD+iDSYWXU8avfaN3hLqOOIOGd05KWlMmqLjFmXgG+vJ8NmzQViSJkA=
Received: from BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM (52.133.130.138) by
 BM1PR0101MB1956.INDPRD01.PROD.OUTLOOK.COM (52.133.132.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23; Thu, 20 Feb 2020 12:49:12 +0000
Received: from BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::79ec:9872:e794:f5e1]) by BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::79ec:9872:e794:f5e1%8]) with mapi id 15.20.2729.032; Thu, 20 Feb 2020
 12:49:12 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: ksm03, ksm04 testcases don't work with cgroup
Thread-Index: AQHV5+uYcFd2vTwhEEKEhFn6MmsXRg==
Date: Thu, 20 Feb 2020 12:49:12 +0000
Message-ID: <BM1PR0101MB145982BF4AAC059931EA2013EE130@BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51419abf-2e86-4860-8065-08d7b60348eb
x-ms-traffictypediagnostic: BM1PR0101MB1956:
x-microsoft-antispam-prvs: <BM1PR0101MB1956E0B3E348F096963072BFEE130@BM1PR0101MB1956.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39830400003)(396003)(346002)(376002)(366004)(189003)(199004)(4744005)(5660300002)(8936002)(52536014)(7696005)(8676002)(81156014)(81166006)(33656002)(19627405001)(2906002)(71200400001)(6916009)(316002)(9686003)(86362001)(66476007)(66556008)(64756008)(76116006)(66446008)(66946007)(55236004)(508600001)(26005)(6506007)(55016002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BM1PR0101MB1956;
 H:BM1PR0101MB1459.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0znK34GP+onKFcrXmYXE2zr72h2RfANaGjOBQHr6RHqqTuf+dxy8rdm8JpMiAplsrDejfdYduhs+w2lLcyF1uWCnIJHfkEMUBuSPFSE0HjZYYUqopKOh2RisElo8rL8JR7dIWLG4SIGVQSBRSnZ4erm37637Tb3HjRjG0GFQQg0nCTxLogI1jxN2V3BbuQWiMXzt5L+8eVrpOQMrKp5R2Phj1+9TLd1+WFWTU59b1948BBP2Sv1Ufpq3vHgYlKSvbiLCsr2vfCC816NpngW/3b+V2VmiQy/E4GOd1lGl0adGaTCH9lWRkIsc9801vTr9+2cBmHD9eD1lcC85CNgQi1qSKnwXH5kb8N966IxBuLTBe9k7qW/FWtZz8d1jmXM0gov8kXLrUKSwjv+mz14nZcOoV0hlfEQOgVBdbK5FNyP3Yii7rQRErZXQfh69W+9k
x-ms-exchange-antispam-messagedata: hiMA0R3frZkP8+mi4iBtpxnxF/2xV+dNk9iVp8FtIzxrRrYCYqFV5CN+T9uYQycW3BveVnaKqak69g4Xx1jfpHCuljO7H/RIUMCno3o38QCQL6r0peB5lM0sr5oM33iGWgIKXcjsyqHoiGR7OHavWA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51419abf-2e86-4860-8065-08d7b60348eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 12:49:12.0525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQfBhMYbqhKadNVZL6zRiGi3rlCnuIlcKrLmz199M3B3SMkpnDYrB5gXnpZBcbrpxhrGFJx0BBnOaEPRx7C1tJ6WaCSCl+DWyMgLV3OSE6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1956
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] ksm03, ksm04 testcases don't work with cgroup
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
Content-Type: multipart/mixed; boundary="===============0695072671=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0695072671==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR0101MB145982BF4AAC059931EA2013EE130BM1PR0101MB1459_"

--_000_BM1PR0101MB145982BF4AAC059931EA2013EE130BM1PR0101MB1459_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am running ksm03 and kms04 on my RISC  v system wth linux 5.4.3,LTP Versi=
on: 20200120-55-g537fb6535
with custom Yocto distro,the test is getting failed with following errors.w=
hy it is failing?

root@exaleapsemi:~/pankaj_ltp/ltp/testcases/kernel/mem/ksm# ./ksm03
tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s
safe_macros.c:167: BROK: mem.c:750: mkdir(/dev/cgroup,0777) failed: EEXIST =
(17)

Thank you

--_000_BM1PR0101MB145982BF4AAC059931EA2013EE130BM1PR0101MB1459_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>I am running <span><b>ksm03 and kms04</b> </span>on my RISC&nbsp; v s=
ystem wth linux 5.4.3,<span>LTP Version: 20200120-55-g537fb6535<br>
</span>with custom Yocto distro,the test is getting failed with following e=
rrors.why it is failing?<br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><br>
</span></div>
<span>root@exaleapsemi:~/pankaj_ltp/ltp/testcases/kernel/mem/ksm# ./ksm03<b=
r>
</span>
<div>tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s<br>
</div>
<div><b>safe_macros.c:167: BROK: mem.c:750: mkdir(/dev/cgroup,0777) failed:=
 EEXIST (17)<br>
</b></div>
<b><span></span></b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you <br>
</div>
</body>
</html>

--_000_BM1PR0101MB145982BF4AAC059931EA2013EE130BM1PR0101MB1459_--

--===============0695072671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0695072671==--
