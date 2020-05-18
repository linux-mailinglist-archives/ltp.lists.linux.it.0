Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EC01D6FDD
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 06:34:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C7673C4F1A
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 06:34:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 8E1283C2078
 for <ltp@lists.linux.it>; Mon, 18 May 2020 06:34:08 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80070.outbound.protection.outlook.com [40.107.8.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 57A20140112E
 for <ltp@lists.linux.it>; Mon, 18 May 2020 06:34:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/WXw7FWeWmUrjbFY0938eWIUTFgT+Ww1GzDPTeUFTw=;
 b=dWI8GuSBvQCMweo5Q12wz0CR7Hg1IQsv3aOduzPdvrDeR4nEYDiVMiz+qFDAObhXPECLaxPaUNsu7YoQTWPjIPF8oGApRz7mTOyp0g5atVi3bdmGEQLj4XvhXXymE0VR5DRUCuv11ZyhX+Nm20frDHo8n0I+jKLF/EJCIJY8rpI=
Received: from DB6PR07CA0108.eurprd07.prod.outlook.com (2603:10a6:6:2c::22) by
 AM0PR08MB3377.eurprd08.prod.outlook.com (2603:10a6:208:d4::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.24; Mon, 18 May 2020 04:34:05 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::18) by DB6PR07CA0108.outlook.office365.com
 (2603:10a6:6:2c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.10 via Frontend
 Transport; Mon, 18 May 2020 04:34:05 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.linux.it; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com; lists.linux.it; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 04:34:04 +0000
Received: ("Tessian outbound b3a67fbfbb1f:v54");
 Mon, 18 May 2020 04:34:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c88045ab33dcd3e0
X-CR-MTA-TID: 64aa7808
Received: from 099f67236408.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10988319-7C98-4D68-BBAF-68FEF97AE366.1; 
 Mon, 18 May 2020 04:33:59 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 099f67236408.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 May 2020 04:33:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+0Q273NF+S36je08BwVaKljh+PljUWi2/WLsaUa/140Tdd7DDtCnQTyjhLIGD/pD9zuQQ5+Wy94Xwwq797E5frjcVpBdCxHtIMfUrCuPa70XqjQXMh8vtyECejP8kVJhLrgGWuiaAS8+bhdK89el5CN1FwWx3fKdqja8p0OVK2YTV6UsyQyuxqPek5IF+7fBcaSFSRMhoa/pKWAXv07qe+cgZ1hVl+lOc2q0MbBX+gc6tems1xGfvndTqj2MjsiJuh7Zbydds776sklSjEUy7ZADIJMy/Lw51gPJbc/FeuOndlj1aIY/R/E9lfoOJRoX5pQ4gqeAVbkXZ52LLjlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/WXw7FWeWmUrjbFY0938eWIUTFgT+Ww1GzDPTeUFTw=;
 b=lJb09rPIlJ4jP01lQ3sH3tX9ll9Rr8PuvD9WxSL2JIUUEXXqNNUmXNm87nl8joa7SRmn+QYqZijZSTJoHtYBdr/LqxlcvuMuD3zks00ayIumdCEET8AkmaP1GojBTfzwRDYuU/V2TdLKZw3B99zmN/Ezt/m1rtVDDkd0qM2PdjnbCouieGVCT4Dfh7Xltg/dLmMfhnh45Cmtz1EKTpvxGnNwoxSroVKo4CCu51hxqCJGivBnhaxJh2c8zPixWlwXIFOnJtR9u70fZhhHBtYo3yaWmKnNLi4yO9AIqGNZzEqBV6ryguWxXyoX7K1yiGNxkVM9uU8CnkdIFYwEOWPHrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/WXw7FWeWmUrjbFY0938eWIUTFgT+Ww1GzDPTeUFTw=;
 b=dWI8GuSBvQCMweo5Q12wz0CR7Hg1IQsv3aOduzPdvrDeR4nEYDiVMiz+qFDAObhXPECLaxPaUNsu7YoQTWPjIPF8oGApRz7mTOyp0g5atVi3bdmGEQLj4XvhXXymE0VR5DRUCuv11ZyhX+Nm20frDHo8n0I+jKLF/EJCIJY8rpI=
Authentication-Results-Original: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB5486.eurprd08.prod.outlook.com (2603:10a6:803:13b::8)
 by VI1PR08MB4399.eurprd08.prod.outlook.com (2603:10a6:803:fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Mon, 18 May
 2020 04:33:54 +0000
Received: from VI1PR08MB5486.eurprd08.prod.outlook.com
 ([fe80::5510:5170:d507:d7f5]) by VI1PR08MB5486.eurprd08.prod.outlook.com
 ([fe80::5510:5170:d507:d7f5%3]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 04:33:53 +0000
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20200514172831.27854-1-vikas.kumar2@arm.com>
 <20200514172831.27854-2-vikas.kumar2@arm.com>
 <20200515040849.yu27rdihdih5wxc3@vireshk-i7>
From: Vikas Kumar <vikas.kumar2@arm.com>
Message-ID: <b13403ce-b7c9-79f6-c303-97763e867020@arm.com>
Date: Mon, 18 May 2020 10:03:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200515040849.yu27rdihdih5wxc3@vireshk-i7>
Content-Language: en-US
X-ClientProxiedBy: DX2P273CA0019.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:8::31) To VI1PR08MB5486.eurprd08.prod.outlook.com
 (2603:10a6:803:13b::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.163.50.180] (217.140.105.54) by
 DX2P273CA0019.AREP273.PROD.OUTLOOK.COM (2603:1086:300:8::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.25 via Frontend Transport; Mon, 18 May 2020 04:33:49 +0000
X-Originating-IP: [217.140.105.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a892f0ca-2e4a-4cd5-3670-08d7fae4b26b
X-MS-TrafficTypeDiagnostic: VI1PR08MB4399:|AM0PR08MB3377:
X-Microsoft-Antispam-PRVS: <AM0PR08MB33777A3F3E18F64ADEE3EC99D1B80@AM0PR08MB3377.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;OLM:5516;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: U1dRZJykzkZ5NO5F/o96QWCnrMDEZHgVqHLl4AOByBYnm63jx2kFs4MUo0DwD+lDzax27m589EEeyG0rpYV/FycAwLBg4ReT1VWxrGY97i4IJHeMPLI+yqFqL61TokLIarS/qJkRBHlycdsHbk3f5lXrdzfi8OiEY2cdZXmJ5pbdreff9QsjHqmMxPVvrsNiXbZ3RILkKG27r+O0x483xcAat3d7IiWy/AY/uOF9EUS3miE8g6NmY2Mv+eqezYSgquk5fF4V4rqN2Cfm5mVixTRYcO1Xssz0RdV0xAiRAtWBthEqNaol542VPxzQLK5rsdNbbZQXzLWNAIK2VrVzUAtdgCayBroj2RQ2tcktZ7YEj/AX6oJQa4/waDTAaoqtquBbEr8Azil8u4DaQgibc0JDJTqZOuXOwPMDYyT4UcK8Ea3uuqwrPu8XVW0FsB2wUpMIXUSnj2Wn0dpVolAXJa1BEyf8lGf8/Bjh2Ifo7Zr9SnPqQwRa88KcuPE9xGLp
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR08MB5486.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39850400004)(478600001)(36756003)(66556008)(6916009)(16576012)(31696002)(316002)(6666004)(31686004)(8936002)(66946007)(956004)(66476007)(2616005)(4326008)(2906002)(6486002)(186003)(16526019)(53546011)(52116002)(33964004)(26005)(86362001)(5660300002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Zp+gKhXNWMyuRPa3MqcWan0O77Q1lr+Gf9XBaCBXT79cpeTLcmxHMPvOF01DzMIFd9NaH5HhUWr+jfSY5DIMrPmblaYe872rzmaU5bI0QxS+UNW5KXyv5YqHqtbOux5MG+ezVgYfxrdotlFnWYCgPKkhcMsBnDXf94pZ386fydJ5ZDLe7XiypTiSW6SvKMZq9cowk1/FqLR6Wxs9//LZw1N7vEb6L09yVf8FM2OU+s1QZ7WLgA3GjDDeAoCNwqmlEXkRxtIwZKmdujUriBqsfVU35zDW3X3gWsMWMWaYZ94sdw3PWp3dU9HRjwIXJLP/7PQFFs7QQnl68QeS1pWJwuRg/0Vrn0MgFuHBBVABpRV0Mlbq/63Z5euVCR4BabEBsGjNskRBKAewYZvdOBOaxzcqoreBH2TYUScQR8++VgnHRw5wTHVVNvGcO89eMerlxZUfBe174T1ZE29E65CK+J4RIF0+qo46eKCxx2NDuXFcbNU/fMq37p/eoa3HRtYx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4399
Original-Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(346002)(396003)(39850400004)(376002)(46966005)(31696002)(8936002)(2616005)(82310400002)(956004)(316002)(6486002)(16576012)(33964004)(86362001)(2906002)(356005)(8676002)(81166007)(336012)(53546011)(31686004)(186003)(70586007)(82740400003)(70206006)(26005)(16526019)(6666004)(47076004)(36756003)(478600001)(6862004)(107886003)(4326008)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3e1da7ea-3ad3-4e0b-9397-08d7fae4aa4d
X-Forefront-PRVS: 04073E895A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1JTKWVh+sv++E7sSi/nMZQY8vcstXuqZ6l5U2PeEG3oDTSYLfx6i4npbJPe8ANh04lx6g9A/xr3uBiPZ+aTuKtmrKIzvUqW/Ilfi1AePYym4jrBm1zrlptTVECe81iDrVavqbx7pNsseBUTer50L6ezawge3QnvOgbWwQtQ/GCVdO2jXh+4yNhNxN5iP0WPZpG2IcZwdzzcsWCHC8P3x3j4JhSbNDc/HA2S05tFXfVbQsl6C9aasPeBxCQAbcrizCTA2WPwMrxYxSspT4Iu3FGGiNRLBnDshEW4HdT4SI4N7rkUCgkNSbKRu4yVc+qmNlE/xQikN16w+p0w2CtgcfyLzu6vaOVSbukGq5Jtx68dc+DXiiko7/J3+1VXjDWmL4wpGKGrj6MFNDEz1uVfJk+5KZ5nnPRrRaoKxSVbCSOOvB0WGsFH8GWzcOpUg0q7jeVkANsKNeqe74S06kxFHsQs9H32dwTrjril2yLwdYSbJUfbtBEpp1oHGjIrweukUrPiX38YGFxO+zex65WrS0ig9QOkbL8kBd30sseRR5k=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 04:34:04.9002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a892f0ca-2e4a-4cd5-3670-08d7fae4b26b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3377
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 1/1] syscall: Add io_uring test
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0309818002=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0309818002==
Content-Type: multipart/alternative;
 boundary="------------B29F15795AF1B24EE66E6ED2"
Content-Language: en-US

--------------B29F15795AF1B24EE66E6ED2
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable


On 15/05/20 9:38 am, Viresh Kumar wrote:

On 14-05-20, 22:58, Vikas Kumar wrote:


Added Linux asynchronous I/O API Test for io_uring_setup(),
io_uring_register() and io_uring_enter().
This test will check io_uring api basic operation.

Signed-off-by: Vikas Kumar <vikas.kumar2@arm.com><mailto:vikas.kumar2@arm.c=
om>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz><mailto:chrubis@suse.cz>



Please don't do this unless someone gave you this explicitly.


Sure I will remove it in next patch set its my mistake.

Thank you Viresh, Petr and Cyril for correcting my mistake.




diff --git a/testcases/kernel/syscalls/io_uring/io_uring01.c b/testcases/ke=
rnel/syscalls/io_uring/io_uring01.c
+int setup_io_uring_test(struct submitter *s)
+{
+       struct io_sq_ring *sring =3D &s->sq_ring;
+       struct io_cq_ring *cring =3D &s->cq_ring;
+       struct io_uring_params p;
+       void *ptr;
+
+       memset(&p, 0, sizeof(p));
+       s->ring_fd =3D io_uring_setup(QUEUE_DEPTH, &p);
+       if (s->ring_fd =3D=3D -1) {
+               tst_res(TFAIL | TTERRNO, "io_uring setup return error");
+               return 1;
+       }
+
+       //submission queue ring buffer mapping



You need to follow kernel coding guidelines everywhere in the code
here and so no such comments. Try to run checkpatch on this file with
--strict option and you will see the problems..

This API is new and you also need to implement something like
fsopen_supported_by_kernel().

I didn't do in depth reviews though..

I will implement io_uring_supported_by_kernel() and checkpatch with --stric=
t option and send In next patch.


struct io_sq_ring, struct io_cq_ring and struct submitter



Cyril: These are local structure although derived from kernel structure so =
it can be local in this file in place of lapi/io_uring.h



IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--------------B29F15795AF1B24EE66E6ED2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
</head>
<body>
<p><br>
</p>
<div class=3D"moz-cite-prefix">On 15/05/20 9:38 am, Viresh Kumar wrote:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:20200515040849.yu27rdihdih5wxc3@vires=
hk-i7">
<pre class=3D"moz-quote-pre" wrap=3D"">On 14-05-20, 22:58, Vikas Kumar wrot=
e:
</pre>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D"">Added Linux asynchronous I/O API Tes=
t for io_uring_setup(),
io_uring_register() and io_uring_enter().
This test will check io_uring api basic operation.

Signed-off-by: Vikas Kumar <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:vikas.kumar2@arm.com">&lt;vikas.kumar2@arm.com&gt;</a>
Reviewed-by: Cyril Hrubis <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:chrubis@suse.cz">&lt;chrubis@suse.cz&gt;</a>
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">
Please don't do this unless someone gave you this explicitly.
</pre>
</blockquote>
<p>Sure I will remove it in next patch set its my mistake. </p>
<p>Thank you Viresh, Petr and Cyril for correcting my mistake.<br>
</p>
<blockquote type=3D"cite" cite=3D"mid:20200515040849.yu27rdihdih5wxc3@vires=
hk-i7">
<pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D"">diff --git a/testcases/kernel/syscal=
ls/io_uring/io_uring01.c b/testcases/kernel/syscalls/io_uring/io_uring01.c
&#43;int setup_io_uring_test(struct submitter *s)
&#43;{
&#43;	struct io_sq_ring *sring =3D &amp;s-&gt;sq_ring;
&#43;	struct io_cq_ring *cring =3D &amp;s-&gt;cq_ring;
&#43;	struct io_uring_params p;
&#43;	void *ptr;
&#43;
&#43;	memset(&amp;p, 0, sizeof(p));
&#43;	s-&gt;ring_fd =3D io_uring_setup(QUEUE_DEPTH, &amp;p);
&#43;	if (s-&gt;ring_fd =3D=3D -1) {
&#43;		tst_res(TFAIL | TTERRNO, &quot;io_uring setup return error&quot;);
&#43;		return 1;
&#43;	}
&#43;
&#43;	//submission queue ring buffer mapping
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">
You need to follow kernel coding guidelines everywhere in the code
here and so no such comments. Try to run checkpatch on this file with
--strict option and you will see the problems..

This API is new and you also need to implement something like
fsopen_supported_by_kernel().

I didn't do in depth reviews though..</pre>
</blockquote>
<p>I will implement io_uring_supported_by_kernel() and checkpatch with --st=
rict option and send In next patch.</p>
<p></p>
<blockquote type=3D"cite" style=3D"color: #000000;">
<pre class=3D"moz-quote-pre" wrap=3D"">
struct io_sq_ring, struct io_cq_ring and struct submitter=20

</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">Cyril: These are local structure alt=
hough derived from kernel structure so it can be local in this file in plac=
e of lapi/io_uring.h
  =20
</pre>
<blockquote type=3D"cite" cite=3D"mid:20200515040849.yu27rdihdih5wxc3@vires=
hk-i7"></blockquote>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--------------B29F15795AF1B24EE66E6ED2--

--===============0309818002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0309818002==--
