Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A91993D4
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 12:48:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B46B13C30BE
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 12:48:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C7CFA3C30B0
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 12:48:29 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9DEFF600283
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 12:48:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPBPw0pPe64MPkJNSWuob+cQuAy+vO0GDrgo00B+RUY=;
 b=HFUQZMa1b7hS3R3aZCskZd+t6hxBvpn7POuI4owEGSDRmZnQwMDs0ejMhsBY8+anId405rwk54b45aAc6zh5Zg+Jv0PFupXo+hkgb+1u80mZyH701aIacT/thqCwz43J/70XENm2Hz/nH+rv824EC+agl8+9woYMvFtmOqzwi5I=
Received: from DB6PR0501CA0027.eurprd05.prod.outlook.com (2603:10a6:4:67::13)
 by AM4PR08MB2658.eurprd08.prod.outlook.com (2603:10a6:205:a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Tue, 31 Mar
 2020 10:48:24 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::88) by DB6PR0501CA0027.outlook.office365.com
 (2603:10a6:4:67::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Tue, 31 Mar 2020 10:48:24 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.linux.it; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com; lists.linux.it; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Tue, 31 Mar 2020 10:48:23 +0000
Received: ("Tessian outbound af37c2b81632:v50");
 Tue, 31 Mar 2020 10:48:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03de9598d627ccec
X-CR-MTA-TID: 64aa7808
Received: from 8e9ed1ba2795.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CFB2987F-F91B-4409-B596-7FC5E4AE6906.1; 
 Tue, 31 Mar 2020 10:48:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e9ed1ba2795.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Mar 2020 10:48:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmgtPKXvdEvPncVrqpXraSF55RYz2rYxVb8gRRQXZBtBHY8cV26GFg9FAEQ+vKlXyAGU+AyRlMJQ4ERGV/bklfeEL9HO7/1JVoDyHaE9Qtx7qJnyC9zW8O0Y1r4po5uSIMhwNH1XBhsrt9VXVtWbcZlwPkL67gnzTUpjCxsfKkXDpWqDa/3mb3N16POheRnmNiXtU6l2iQRH56pFwtOYk15U7xj1yMzbsyKgm3RoQnFRxJ5WhNFuOa6S9m8MEcvXWGdRVdSbOxrTVl3ucL1xO3ekC/ta1GKA8MZHyAhScVDOJY+vuWoegbmHv3yaaL9Z/4qRaLyzbBNgCr4q+Z796g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPBPw0pPe64MPkJNSWuob+cQuAy+vO0GDrgo00B+RUY=;
 b=D0RiAJjEPxf150Hx1dmSMYCOnqbAJ92KLvOHF7Bj/Oz5muTnPGqUL1qkmypudiPLFqV0tjsuvjfd5anfIydmG/hHVcIH6D7GGe1ZX9gXt0j9gVtnudP78mF3TPVAfj6RZ4/ZNSQ83w7sndmgGNb52Ng+39/Afwmev+CqGJXeHh6s+l15gs9g8ZrGuMIDIcss3FyC1Ghkm/QxWUAIKa1SaMioXNQ7sSJ19SAspRIzDDVHA5l/2Z3KrMSuCBuFHMy+lo0DeSqkQAqEZ0lNhO5fNosXrnYMvmi7FJvZfzlawft6AAwm2quA7bPfNlrP9PEgpGNFEd0nEkJMjWeAytX2mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPBPw0pPe64MPkJNSWuob+cQuAy+vO0GDrgo00B+RUY=;
 b=HFUQZMa1b7hS3R3aZCskZd+t6hxBvpn7POuI4owEGSDRmZnQwMDs0ejMhsBY8+anId405rwk54b45aAc6zh5Zg+Jv0PFupXo+hkgb+1u80mZyH701aIacT/thqCwz43J/70XENm2Hz/nH+rv824EC+agl8+9woYMvFtmOqzwi5I=
Received: from VI1PR08MB5486.eurprd08.prod.outlook.com (52.133.247.136) by
 VI1PR08MB4142.eurprd08.prod.outlook.com (20.178.126.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Tue, 31 Mar 2020 10:48:17 +0000
Received: from VI1PR08MB5486.eurprd08.prod.outlook.com
 ([fe80::f113:2f9f:4324:6de0]) by VI1PR08MB5486.eurprd08.prod.outlook.com
 ([fe80::f113:2f9f:4324:6de0%5]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 10:48:17 +0000
From: Vikas Kumar <Vikas.Kumar2@arm.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH 1/1] Added Refrence for Linux Asynchronous IO APIs
 in LTP
Thread-Index: AQHV+P+ptnt0Zo36C0ihGSZ9q7vt3qhioEcAgAAAzvc=
Date: Tue, 31 Mar 2020 10:48:16 +0000
Message-ID: <VI1PR08MB54862EB0A8D21C2C83545F23D1C80@VI1PR08MB5486.eurprd08.prod.outlook.com>
References: <20200313062058.7058-1-vikas.kumar2@arm.com>
 <20200313062058.7058-2-vikas.kumar2@arm.com>, <20200331104256.GA12790@dell5510>
In-Reply-To: <20200331104256.GA12790@dell5510>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Vikas.Kumar2@arm.com; 
x-originating-ip: [106.51.111.18]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 23961609-0d84-4a12-f47a-08d7d561093f
x-ms-traffictypediagnostic: VI1PR08MB4142:|VI1PR08MB4142:|AM4PR08MB2658:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR08MB265874BD1705A5B0E9375BF3D1C80@AM4PR08MB2658.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:10000;
x-forefront-prvs: 0359162B6D
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR08MB5486.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(2906002)(55016002)(8676002)(55236004)(4326008)(186003)(6916009)(316002)(86362001)(478600001)(76116006)(52536014)(6506007)(66556008)(33656002)(26005)(7696005)(9686003)(54906003)(81156014)(91956017)(5660300002)(66446008)(8936002)(19627405001)(53546011)(81166006)(71200400001)(66946007)(66476007)(64756008);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: P9M1RwcDtTVvdQzH0VBA8VHiLu7/ON1lbF4d9O9/jzsryOEF8Cju6lQjNp4EIok8imvZqRFdFT3FPsELtpnvdgSTrcgdC4QV/pgKY9xToINHe6mlNf7yE3AmkK3qbA6E+YQJp8GuZCHBL6SY9Ls911enjSHC+ScXeJRQ34ruwyygjPBbUCdZVpUNWs6aLL6yWIGB6tNcNqnxl5skd4ZcgLnC0pei/Mueys5Ro7wcMIBthCSBttcni2EYIK6+HfCwKSY/H8N2pB8WdYqaeElz88s9JHQdgZT4LLPxND7IaMgm3eKHXsZPazHcXSusajjL4atQb/pMsGk4k64gY9QHRMAF4cAiaSX351dDFnJR7qcCilnm/LQTF+xWPUag33u2ue42Jl39hIxkhCkXSaTaNAzd0DBryYfOxM25sRTEB9iGCjgds9NWI8eTGqs0ZdwI
x-ms-exchange-antispam-messagedata: hOm7gSMxsmyE3K7lKj32HdfEvCefY5jLtNafUYKz8Yzgq4elO2tQGpgi0qQ0FNLZQCXxjW9QEz0PLIAWojJ+sAuR8CYTxLX1kSvE7qFK9tKlhp1Q/p+8xlZ1tDw9YS62bqeR6qcFROphkvAR6ViZmw==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4142
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Vikas.Kumar2@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(7696005)(2906002)(8676002)(81166006)(336012)(478600001)(6506007)(19627405001)(26826003)(5660300002)(53546011)(8936002)(81156014)(70206006)(70586007)(33656002)(82740400003)(4326008)(86362001)(26005)(54906003)(107886003)(6862004)(52536014)(55016002)(47076004)(316002)(356004)(186003)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8c46c772-a882-417f-a9bc-08d7d561052d
X-Forefront-PRVS: 0359162B6D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gMY/M1zvE1kZCOVRYNRKgr6MSUD0chIgU3v0yrIMr5SVCQh8jaX3c8S6q7QRIXtORlo/Zm/IjcplnYTju7RNj7UfHW6E8JJ6NvNwlwKvrACAH8+xFiN853H16cNNW3WfTZQlhtpk6swoWuiTT50+JJlnBRX+/ik3p7oziII8pjBWFETaEuPLvo7uj9OcQsW9YgElUsjxSuRBpi8bSPKCKUKKmAo7/DYj+Hz4LvXUN4A30aVJwB7lQmSbf6MYF6S3UiqyIh37xLUcqEYBthOITH1l3w1f+wxRHrNjcTRU7xlB28SoyKYFr0rfoLQcBGqfluzhRZY/cG3w8R7HeGpx94RYL1ud1LxtlVauSVef2V02k191+r5qvP+4wdPZ7IjaZpQxjYX8KF1qPf2VTDsCl4saSsXabKVNR0nIm7kTtYnZUcXJkLR9pMgIkrP3QiJ2+nYqZE60a5FAYJF8F1uUkRjMVNbhh2nLInzZ74zm3dNTjkMajcRwhlWnwMsWb0eLQJN6p8y5tFhpAhjrhxIsCQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2020 10:48:23.9874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23961609-0d84-4a12-f47a-08d7d561093f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2658
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Added Refrence for Linux Asynchronous IO APIs
 in LTP
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
Cc: "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>
Content-Type: multipart/mixed; boundary="===============1103267382=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1103267382==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR08MB54862EB0A8D21C2C83545F23D1C80VI1PR08MB5486eurp_"

--_000_VI1PR08MB54862EB0A8D21C2C83545F23D1C80VI1PR08MB5486eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

Sure please go ahead with header and configure.ac changes.
I will post next set of V3 Patch changes on top of it.

Regards,
Vkas
________________________________
From: Petr Vorel <pvorel@suse.cz>
Sent: Tuesday, March 31, 2020 4:12 PM
To: Vikas Kumar <Vikas.Kumar2@arm.com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>; Anshuman Khandual <Anshuman.Kh=
andual@arm.com>; viresh.kumar@linaro.org <viresh.kumar@linaro.org>
Subject: Re: [LTP] [PATCH 1/1] Added Refrence for Linux Asynchronous IO API=
s in LTP

Hi Vikas,

we decided to take only header and configure.ac as these are valid parts an=
d
good preparation steps. So I removed the test itself and also updated heade=
r to
reflect v5.6 changes.
I also dared to remove your Author: line (but kept copyright of course), as=
 Jens
Axboe and other kernel developers are the authors :).

Kind regards,
Petr
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_VI1PR08MB54862EB0A8D21C2C83545F23D1C80VI1PR08MB5486eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Petr,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Sure please go ahead with <font size=3D"2"><span style=3D"font-size:11pt">h=
eader and configure.ac</span></font> changes.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I will post next set of V3 Patch changes on top of it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Vkas<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Petr Vorel &lt;pvorel=
@suse.cz&gt;<br>
<b>Sent:</b> Tuesday, March 31, 2020 4:12 PM<br>
<b>To:</b> Vikas Kumar &lt;Vikas.Kumar2@arm.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;; Anshuman Khandual=
 &lt;Anshuman.Khandual@arm.com&gt;; viresh.kumar@linaro.org &lt;viresh.kuma=
r@linaro.org&gt;<br>
<b>Subject:</b> Re: [LTP] [PATCH 1/1] Added Refrence for Linux Asynchronous=
 IO APIs in LTP</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Vikas,<br>
<br>
we decided to take only header and configure.ac as these are valid parts an=
d<br>
good preparation steps. So I removed the test itself and also updated heade=
r to<br>
reflect v5.6 changes.<br>
I also dared to remove your Author: line (but kept copyright of course), as=
 Jens<br>
Axboe and other kernel developers are the authors :).<br>
<br>
Kind regards,<br>
Petr<br>
</div>
</span></font></div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_VI1PR08MB54862EB0A8D21C2C83545F23D1C80VI1PR08MB5486eurp_--

--===============1103267382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1103267382==--
