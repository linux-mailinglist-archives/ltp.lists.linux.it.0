Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FC53245D7
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 22:35:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B357A3C5A72
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 22:35:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 310583C5A64
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 22:35:37 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6F39C601AEB
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 22:35:36 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11OLOG5V108096;
 Wed, 24 Feb 2021 21:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=J1ncvbG0O9NPQByF+UNKjzrSEdYRU5leb3LFAHQIxMA=;
 b=hmSEOwTO6KUnXlcwzXvUlsI1nNB09rVaqA5dENc2QLpZccgWwi7d1c7ijd8HzxS2ua19
 17mhLPYN/6MVmSg1rmDpHmAbWhcTxb4q/K3ieSNt1MLgLnr5LNRGCcoke75OJFIKOSyw
 7xwMdxUeZnvqWXNxY9S9253kjHVUAU+/OeXb9kG6NMy4GWEfRiUrwmh/eCPYtZ3HI/f5
 k1tzgmct0HEThTyy9kmoJ3mnqkfnBABOjl9fPfWBH/2dNgDRfVqCH/dCkmfD4PoqC6J9
 YW9oM82JWevnsvntsKIaoMl69V27hfX/eWfLFstjRoX/3N2dBsfcgg7UfRhAxYLpqWAj 1g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 36ttcmcf0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 21:35:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11OLOYeS045128;
 Wed, 24 Feb 2021 21:35:34 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by aserp3030.oracle.com with ESMTP id 36v9m6fp3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 21:35:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hE/A/YKdsJiN2j3sc6Un5a3X/1Tu6WF06eW8UCM48HfDNl9nViWnJv9iWRznJ1AJPzfgK4wqvCHu3b0Y8Lnd6x+ehgX62jPxqF39mjhENdIlGFqdSD1DY1VyYIrlJ1GlPcF6Y+LZ8fXsso5dgzJBU20qzZv52488dt0/2Nv3Tj75+xlszVnVEIzBWPIxK5gdLLYtbgrTu1CW1Wtq1qdi5zX8tYHuIv9sSdEwH3YXBVuZxCC2eDgR2xvd2zqjxAGS4ZyInhpl508ZyrJD/A0gqtluJPKKgsmWawmNb4sOyfyk8Y95mE3sDaa4ogVOX9f1nudeGcpw7JibwGO5eXutlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1ncvbG0O9NPQByF+UNKjzrSEdYRU5leb3LFAHQIxMA=;
 b=WBijSzYSfg+pSyxs7v1xY0sUc0zb2dHPMGskvulfADluIdgHmYLsCgjNjjsCstQHzi/Wsd9PpoOPh+Nw3IQL3g4scC5ht2r1M27RzUwy/fsma5zx9wo16iD+NyeuGUFeIljz6FkACNB5PCneTNruRfaqzALantwCy4CmwkHQdb70rjbdAjY+LULjR03EjqY93khCL31DTZTte8DQS/rT8BYjDhfbu2arKgz7S11+BlLYNjTMUMtAZ/q2NaxFxPVwk/YYtPw/RWvwiRpRbwBsFPED08toyCst5yxxzRcYGHlRtg9wX7nqIC4PMSIjzn/CYdgEUAkLWT/AL9DQvEZAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1ncvbG0O9NPQByF+UNKjzrSEdYRU5leb3LFAHQIxMA=;
 b=sAqdIDd4gNZ580ZapnSTX/WDs0lpVjMWhBBSSnK8WTwHnGoSj36MU8VViPgK+Hc8dSlSiZJRfxdwWdO7Ctt1aRuhiIPcZ5dqY3a3ZWJQw3yZQIHi5LxIQFiBfy5bzd64OpBnQfnIvrtx2jzT8gP3w8REfdmOqrvoy1F05Yymxf4=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by MWHPR1001MB2191.namprd10.prod.outlook.com (2603:10b6:301:2c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Wed, 24 Feb
 2021 21:35:32 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::ac3f:8441:8f0c:2c89]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::ac3f:8441:8f0c:2c89%11]) with mapi id 15.20.3890.020; Wed, 24 Feb
 2021 21:35:32 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH 1/1] brk02: Add test for removing more than one VMA
Thread-Index: AQHW/vEJ2ahBvo0RJE6dlD0EKJ56KapUVWaAgBOWngA=
Date: Wed, 24 Feb 2021 21:35:32 +0000
Message-ID: <20210224213520.rfdk2hdslqua7a2c@revolver>
References: <20210209143702.2003038-1-Liam.Howlett@Oracle.com>
 <20210209143702.2003038-2-Liam.Howlett@Oracle.com> <YCZYB2w+Il5F0TlI@pevik>
In-Reply-To: <YCZYB2w+Il5F0TlI@pevik>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7d0de80-75d8-4a8e-ed62-08d8d90c1cfc
x-ms-traffictypediagnostic: MWHPR1001MB2191:
x-microsoft-antispam-prvs: <MWHPR1001MB219177E1E37C2262FEB79A85FD9F9@MWHPR1001MB2191.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fugpQUaiZfF6Hf8SIZKmNKttEqUlmkpo7IjTvrxwnHYA0Ot7ASQqcny1YSqZkhAuHqadIlIojk4moiMuvNrDE9pvpxn3MmZt3dXpg+MCZ0N+yJWJ19CuSFnLxR7YLhsHaZA2EIQ8DTeraLslbHhOcTDdbn46xLSx3BhQFerz07mR7i2Ok7ZZJt2A4tddyr8b571y7TOF+rPWSY4xae10bwTrOdL2yXahdG8yaPGoXtpo5sFBCvHMdkdUIXVFRyeCOptJ30M7cyRU6Pgvh2HxwZeJ+KI2GxBfiO09tKdz5NQtkOUAXApO+IHhd8Boyd8G3eqFPi2EyuuOx7a6Fn1YKhPjKhl7JeAmdGq8JMaqXtFVzt/XcplsK8mNgBGwzaa0uUrR552NpCCpERwsh0y6Y/vJcBdCsHc+izuYWeFPNxYZ06YWVRajP9lfPhdvxcsmALQqVHC+IONYWzajVmiW9BvbfVK5upXRlaxeg64r0erHzQwvAy0CwNQG0HZnaJNA93NNow+6/Gol3QllJS3vgg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39860400002)(366004)(376002)(136003)(346002)(396003)(86362001)(2906002)(4326008)(186003)(44832011)(66946007)(76116006)(66476007)(6512007)(64756008)(6506007)(33716001)(9686003)(8676002)(6916009)(66556008)(26005)(6486002)(91956017)(8936002)(71200400001)(66446008)(1076003)(316002)(5660300002)(83380400001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Xt7R0arxpFzDNP9ToUJYTMI108cMHYK5hsSigkh44KUoncaN12gld04qjkae?=
 =?us-ascii?Q?s0nEDqJ2ZR2dwcBbUbNXhgSL0bATwGfeDIbD0YnrPOqCUh/Yw/ruFQ59l5t0?=
 =?us-ascii?Q?NKX8RVnbfd/8B5ADrjUBCHEB2o6esehpf/tV3wI3mz5oDjfskzhAApiS/HlU?=
 =?us-ascii?Q?lgpYZy6yP3qKI1bzmP0Bjk9tpNMmHk0WvTqVNOUziBOs0NawE7KMmJ1mJiPi?=
 =?us-ascii?Q?L+XwYmDlEfhn9+IIWAfFaUkZvn2arM0ltwJ+QaQy5JyyKHAKmVLBXIyPfPBE?=
 =?us-ascii?Q?zHmiiyFposUrvyh0fKGGuxU8zQMNhzffiOjGeqasH/YCKxjAu0p1IWIXjoDS?=
 =?us-ascii?Q?1W7SkJI8BwrVkmbW0HrpPIwLRR57B9RWOSzJxCoEonMm6vAQOrQgqM8UkhhL?=
 =?us-ascii?Q?OVXnDpVCdmtuTtLfapZiprk49LxOfRxCYj24Ez45lNePLMxGLMLDjpkRko/O?=
 =?us-ascii?Q?9zJnUNIUIK02cxtFHAN+tnwCvSRm3efRnye3jp5pxce2EoSrCXkbugIP0MWz?=
 =?us-ascii?Q?qEsKzz2Lwn31sol+LPq8F+zRc7WmzZzotG0Fj/jPu6y+c92U238qPBUnxXVJ?=
 =?us-ascii?Q?PYs6h/KyEPi9HdSHor4MdUJDP9iAD5YlPO7qXuql9qc+V2Re3DyIlwYFgi//?=
 =?us-ascii?Q?UeJUA0XJcaPnhBYH9whp2VQfHHdqzhsDIRapZtzBJhpxZ4f4J9iaWV3U8psY?=
 =?us-ascii?Q?IC73eyZVPLFOry4NsLE6d94FG+SUPg4+5NiLCfRNS/HUGn9QbBOdjID2GL/X?=
 =?us-ascii?Q?COGjtFzyESPOsnQLjw1bGou3d4Ig9yEUuOacxD4K9gwVuEix9IW4ixd8asrf?=
 =?us-ascii?Q?FdP7EdSsIk3BLraetn+8+AWuooMrV41QtDN6jVQ2VUQpxOfnR7fejFjgvfLI?=
 =?us-ascii?Q?hG93VULTaw8gWwTTuvppz/xj3afvQpSNrVRx4KnCA+MGh1hBtOoJtu7CNdvG?=
 =?us-ascii?Q?IST091LSkdL2d5rV97XsgzbyWpjevRrLXU2++xXun5PLbM3OFPBu6sABsPVy?=
 =?us-ascii?Q?1cJ7PXVtyb9Eew0Y8R7erCGdrIgqkZp/xB20s81Cvk+UnG8CnaK0GINb0/BT?=
 =?us-ascii?Q?rtEqH8nu/Qm92W6DfeIgY0e1hsOltCGoWiCnQbRBWyFSjIYbVyw/VPyvQ169?=
 =?us-ascii?Q?jBK678KN/KoM33yhAyOaIiNrfLhnKeq6RbjrabTKNDKq0Tvymmz6pQyagIQ+?=
 =?us-ascii?Q?emNK96hYchCJjE3CdQYF1CwZpMS2Zd8pX3kM53kO45vsvv8GoX4SB81pCk+N?=
 =?us-ascii?Q?CAyCTXdgQsisrBfhec33g2BCs3kcEiQYFyFAHySLX6eLE9Ajn7f5ncYZex9O?=
 =?us-ascii?Q?GDFP80fJOwghxfrqHCC0K3kM?=
x-ms-exchange-transport-forked: True
Content-ID: <4AC21E4DAB614647AB04EC34D19A61CE@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d0de80-75d8-4a8e-ed62-08d8d90c1cfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 21:35:32.0728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WdT7q76fmJJx3qCulH6J32U0fSqx4NY7SG7u68PfChY8jU6eIZdavkvktN7G/pbUUCkoq4Mc7/IRpbGz0twmTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2191
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9905
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240166
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9905
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240166
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] brk02: Add test for removing more than one VMA
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

Petr,

Thank you for looking at this patch.


* Petr Vorel <pvorel@suse.cz> [210212 05:27]:
> Hi Liam,
> 
> thanks for your patch. Minor notes below.
> 
> > When brk expands, it attempts to expand a VMA.  This expansion will
> > succeed depending on the anonymous VMA chain and if the vma flags are
> > compatible.  This test expands brk() then calls mprotect to ensure the
> > next brk call will create a new VMA, then it calls brk a final time to
> > restore the first brk address.  The test is the final brk call which
> > will remove more than an entire VMA from the vm area.
> 
> > Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> > ---
> >  testcases/kernel/syscalls/brk/brk02.c | 49 +++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 testcases/kernel/syscalls/brk/brk02.c
> 
> > diff --git a/testcases/kernel/syscalls/brk/brk02.c b/testcases/kernel/syscalls/brk/brk02.c
> > new file mode 100644
> > index 000000000..834fe9f2f
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/brk/brk02.c
> > @@ -0,0 +1,49 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2021 Liam R. Howlett <liam.howlett@oracle.com>
> > + *
> > + *  
> nit: blank line
Will do.

> > + *  Expand the brk by 2 pages to ensure there is a newly created VMA and not
> > + *  expanding the original due to multiple anon pages.  mprotect that new VMA
> > + *  then brk back to the original address therefore causing a munmap of at
> > + *  least one full VMA.
> > + */
> > +
> > +#include <unistd.h>
> > +#include <stdint.h>
> nit: Not sure if <stdint.h> is needed.

It is not, thank you.  I will fix it.

> 
> > +#include <sys/mman.h>
> > +
> > +#include "tst_test.h"
> > +
> > +void brk_down_vmas(void)
> > +{
> > +	void *brk_addr = sbrk(0);
> > +	unsigned long page_size = getpagesize();
> > +	void *addr = brk_addr + page_size;
> > +
> > +	if (brk(addr))
> > +		return;
> > +
> > +	addr += page_size;
> > +	if (brk(addr))
> > +		return;
> You need to add tst_ret(TFAIL, "failed due ..."); before each return otherwise
> you get error:
> tst_test.c:1080: TBROK: Test haven't reported results!

I believe you mean tst_res().  I will fix it.

> 
> > +
> > +	if (mprotect(addr - page_size, page_size,
> > +			PROT_READ|PROT_WRITE|PROT_EXEC))
> > +		return;
> > +
> > +	addr += page_size;
> > +	if (brk(addr))
> > +		return;
> > +
> > +	if (brk(brk_addr))
> > +		return;
> > +
> > +
> > +
> Please remove these blank lines.

Will do.

Thank you,
Liam

> > +	tst_res(TPASS, "munmap two VMAs of brk() passed.");
> > +}
> > +
> > +static struct tst_test test = {
> > +	.test_all = brk_down_vmas,
> > +};
> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
