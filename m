Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A89FD326725
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 19:55:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 683E53C5A26
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 19:55:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C94763C5853
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 19:55:36 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5CE1E20074D
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 19:55:35 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11QIeJ24111863;
 Fri, 26 Feb 2021 18:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=jOFg9bKXpB5x6zSKDndCCo3weTziTlogSmi6bF7lMGo=;
 b=CU1bdDmS+IjvE6s+5dPKAkFftWMG7bd4azkv5ryBHvZ+bDUlWS1dki5jlOTIzUlz4OSg
 L4TCGMCY65WT5DdVs0mdugOYnJF8SWAcG4tbf2shZ2GkaUIzFlagWczWZgcR10AkQHkb
 gtHvgQCjvTZIAo+dz66/AEwCO11+0l/9ejIkFwgYVlhI3LJyQP+QPpW/6EKiTkGEm+Zy
 66EHwdeWu6osgRnu4INDeWm7brdNay1oR+HaUJB/fvA0pDnFlUn8J3GjtChWCUj2nnhC
 MZOXygIZOlCLxi9JXJnTJYUVHPluDOwNY6pHFOxnLW2QDPGICBa812ETUnDE3aYOll8h tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 36xqkfagkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 18:55:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11QIeWqm099221;
 Fri, 26 Feb 2021 18:55:29 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3020.oracle.com with ESMTP id 36uc6w877p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 18:55:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx9TEUegcawm/6KkPQrycF2tQOJPHe+RvXUFd/o0Q5mi/p52Oo3Fo7CY4UFtOZ+65pQU9K9e8mNhpufpL+5xgf7qE15/BYDlYJpN1xAzq8zCRlyhc9Ea7ZAW9ijkTIYJ7WwjAYTxbTKVI3UfOv4B3ATjjjQsvLHC+VOfTUNqNqpXU8S8eKkMHiApJ8ou4LqWLe0tbcAoH3oos5c9SQ8tSe0OBxdpPmcnziZiVZnKl2i+XlHVZm/AELIsyk2vrz/GtCLnyRJK5+hwqkNZRH+sVKPBgnWPDXnrrZV2JkTCtimAVyajJO1VNh4lkJNhUplH+XIa3uUsBdhpdLwS9AsPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOFg9bKXpB5x6zSKDndCCo3weTziTlogSmi6bF7lMGo=;
 b=bstCko6sEk1+ayCmX+amWOQqxIaW93HppjxwLcXM2co7dA7nwtHOP2s+GPOyeO8oe3gG4HGPdeGKwOdlbBRaOKzpF79jhu/FSLNz7aU0H/aHlpjOLf3F+lOXx1XTG8LgRneo2tNXJzU3pVBmL/AaYJKWoile1SJp/+KAMIxboPcZHPptb4Ouxnuzvlc8Ttaz0nKUZplgGRLoYdNJQO0b4fp9GKE+LQCYq4efg463If/aRTDaDkRzMgwBzwRWDZ5V3D9Unf0sJwpmk5sFFtO3ilBR9ENeLUbKYhe1nqASsBQdX1QVJ0YexTNpyRQLY+/ztb2ehLApcDtL+RAIThDOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOFg9bKXpB5x6zSKDndCCo3weTziTlogSmi6bF7lMGo=;
 b=GvhRbeEnbk1arG6N7xyfJmzqzlseNHAi+Re2j1UQdW2OCrc9BVZkQO1Nd1ufD9KYRmDQF1LFbjKs/+fblBpUUUCEqREdpXc5ik0HQbR+3BTyAW1V+cKwaot7V+xsW6PRQO5kiHr6ilgdOPPPMBklxJUGG2M0NMjiY6DUnBWto24=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by MWHPR10MB1469.namprd10.prod.outlook.com (2603:10b6:300:1f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 18:55:24 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::ac3f:8441:8f0c:2c89]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::ac3f:8441:8f0c:2c89%11]) with mapi id 15.20.3890.023; Fri, 26 Feb
 2021 18:55:24 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one
 VMA
Thread-Index: AQHXCvRm2LPXqQYmf0Wq1gEM3bkluappO4QAgAGQaYA=
Date: Fri, 26 Feb 2021 18:55:24 +0000
Message-ID: <20210226185515.v3nd5usnf24ab5xk@revolver>
References: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
 <20210224213114.2976705-2-Liam.Howlett@Oracle.com> <YDf0MHBoZRildsna@pevik>
In-Reply-To: <YDf0MHBoZRildsna@pevik>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac95e9ad-afb9-4fd1-b0ea-08d8da881360
x-ms-traffictypediagnostic: MWHPR10MB1469:
x-microsoft-antispam-prvs: <MWHPR10MB1469ABDA9959FDA798C19EEAFD9D9@MWHPR10MB1469.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZNxzD9mGKw+KeKWGNudgQCzs/spvOLPNeV2xVNopi9ePgRxGFKDYtMou9iYnhVXD5zfTRX8t0Vw4eqn9AH04Qm00bqb0XL4Pqv7z6w5OMd6IqWqqMAo42XYZqDh7dd/8MOxLkNGYjI4D2vL57JiFO1sI52ZKc7RxvAo0qOaok2zIepPDclqY2xtBVU4L6jukKIusJXmwn8g2U8HBQ1f9PaotOiSaF45kpl1o5vddtJnHPPIVOj+theGSTHLrv5xI7yula6XedJyModiIWEkCXED2pqHXk0E193JcgFzZN2zNNZ/3ea41fv17o9Iw071CPMXebV9PNk/DDZAlRUHcS6KHMwqPGUSNV8mneQjk2UtxLmhVIVxkejB5QzxU0wT/AHmxZYEVSnbxsHSpnGnOoB3FGxxY6Ibu+EDc7wp/n8asM9vhuHIQKj06kHi/lgPX8LvgPK0Uk6RUblOpBjm4OKThdWRGVw4cgotFHhQb9D7G4Tfjo+tjlCg8k33SJim+nzxoRKkMkDAKwOCrNtfc9w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(346002)(376002)(396003)(366004)(39860400002)(136003)(186003)(316002)(26005)(6486002)(5660300002)(2906002)(4326008)(91956017)(8936002)(478600001)(66476007)(66946007)(6512007)(71200400001)(66446008)(8676002)(44832011)(83380400001)(33716001)(6506007)(6916009)(1076003)(76116006)(9686003)(66556008)(86362001)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+DuolcwQIKhQF3BHicK5qhnFXha0Ze6jVmn/x8nkZsLuFiuis3D5Hkl8UBj3?=
 =?us-ascii?Q?5XSu9ntBME4trXYUzwZx+njkYI+38V/VJlcZIu8HQvV7FnIspJZM0x/1q6g/?=
 =?us-ascii?Q?i2FeSq2M8mGdDL2XlzpANYCL2QXfdfoaBi5InTmOSJecE3ljU78i2LFKWfj9?=
 =?us-ascii?Q?z6ZmxavHND6AJAjQlbsOxNwiHfoBAnbZQRvu0BGpNv980u6oCHuW75dzn6Z2?=
 =?us-ascii?Q?UObkYOp1LmbCq6qotKDFQVHUl8/qLTiwPPOA9ZK5ObR1zxxlvZVGHllMIQj/?=
 =?us-ascii?Q?BXuc7DcUWA9pFUKjUDGn+d/RvhPs9sJsOhlWWgYU0KzA108DlZX+REHHOeh7?=
 =?us-ascii?Q?X6EcJTNMxSqhi5zOxLVEsRTzdJBet+1iFM3f9vNqlTVP3+/qg8u1FULdh4z0?=
 =?us-ascii?Q?tafdYijTzGJTkdzsZm3njTQ8+izcqfg/Ls+dtKKOR5jJ6hyvgu3P66JLQSqa?=
 =?us-ascii?Q?Vy3ScXcgDvg3hOMUWIcgGgmvoDGqYJF7b5SHPl85rbVuiZFwoGxkwQmeLUk1?=
 =?us-ascii?Q?rOLf7ZEeQiQqK0St+TYep7u2RJZ0AHtt52tvld6GcVuUXajzpGfw1DhtkLkr?=
 =?us-ascii?Q?5aHtPZpsI/J9Jvcbv2QmJWF97sMW/1kjOGb7x2gA/9ypAqZ3r7aAtIPSau+7?=
 =?us-ascii?Q?2KNHA1/rklTcdkMNYq9JvhPCiBqKVLjCsnzU3pr2i7HIZAq+rE3zvtKdkMgR?=
 =?us-ascii?Q?I1DwLznH9nuj2tNJw46Ykqh9z0nj2QDNro4F6cKBbUZwhf3n6wA6eg2e8DY0?=
 =?us-ascii?Q?2tM7fO5D1YiKuMglHcsjKZpOOplGZih9WfCntSrAdXIkO9L6Vn9EHdQwI49c?=
 =?us-ascii?Q?+NPCyL8Pq31944N790eX0CmmvTK9efmRRNeGYIhJuPBce0tyxsPOUXANuIRT?=
 =?us-ascii?Q?rexQ1GbFlxYntGAJLIb93Zy/ZhbkOwE2k+IbgOZTY/tk8/t2GKaGtVSvgyt2?=
 =?us-ascii?Q?O6/+7ysHevAxTS77LV8LfvTnDmRL64Hb56m3FYzh8dMYtFlgIiUFjMrwHZ7D?=
 =?us-ascii?Q?ANrSC+ASqJa/yhSMAgOTK5V9Y6nlesaft9VTUSe1Q0gw6ibIEJ04cV1YmheC?=
 =?us-ascii?Q?ywHJegYZSKvu3BjFf/h5wjJ/w6HrH1si+N3d/sKhkiqCxv1/rcR7S48lERRv?=
 =?us-ascii?Q?kiixMuTO6cLrL8fdQgP3B5ihyj8QI0TLskId+IDZVwD1Te0dWd4UqQSskO+v?=
 =?us-ascii?Q?cMqnb9/39ltg9tf8I11v2M34UUliWaKtj6U6Lfl283JTlsLBtKpfpYPpdkSp?=
 =?us-ascii?Q?he/6vuNMci2wGBrjFmKb96K0wdvZuUCDwqK95lRVk0g/EW45pOx1GkaWYEq8?=
 =?us-ascii?Q?0YsXAxtLPD67DMNb3mekMrp8?=
x-ms-exchange-transport-forked: True
Content-ID: <94701373A484F8449D26173D9A79022F@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac95e9ad-afb9-4fd1-b0ea-08d8da881360
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2021 18:55:24.6677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aXCFsGGTzIcVn5RsitQgnzioYngWs5LRCte3Bv/f36b+9O+Y4wzTz+qrdbpvBZjJ4m55KUeEVFapChJx00KHNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1469
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9907
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102260137
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9907
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102260137
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one
 VMA
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


Hello Petr,

* Petr Vorel <pvorel@suse.cz> [210225 14:02]:
> Hi Liam,
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
> >  testcases/kernel/syscalls/brk/brk02.c | 54 +++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 testcases/kernel/syscalls/brk/brk02.c
> 
> > diff --git a/testcases/kernel/syscalls/brk/brk02.c b/testcases/kernel/syscalls/brk/brk02.c
> > new file mode 100644
> > index 000000000..ef84fb440
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/brk/brk02.c
> > @@ -0,0 +1,54 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2021 Liam R. Howlett <liam.howlett@oracle.com>
> > + *
> > + *  Expand the brk by at least 2 pages to ensure there is a newly created VMA
> > + *  and not expanding the original due to multiple anon pages.  mprotect that
> > + *  new VMA then brk back to the original address therefore causing a munmap of
> > + *  at least one full VMA.
> I'll put this as a docparse formatting (will show in our documentation):

Thanks

> 
> /*\
>  * [DESCRIPTION]
>  * Expand brk() by at least 2 pages to ensure there is a newly created VMA
>  * and not expanding the original due to multiple anon pages.  mprotect() that
>  * new VMA then brk() back to the original address therefore causing a munmap of
>  * at least one full VMA.
> \*/
> 
> > + */
> > +
> > +#include <unistd.h>
> > +#include <sys/mman.h>
> > +#include "tst_test.h"
> > +
> > +void brk_down_vmas(void)
> > +{
> > +	void *brk_addr = sbrk(0);
> 
> Shouldn't there be a check?
> 
> 	if (brk_addr == (void *) -1)
> 		tst_brk(TBROK, "sbrk() failed");

Yes, you are correct.  And -1 is the correct thing to check.

> 
> > +	unsigned long page_size = getpagesize();
> > +	void *addr = brk_addr + page_size;
> > +
> > +	if (brk(addr)) {
> > +		tst_res(TFAIL, "Cannot expand brk by page size.");
> nit: remove dot at the end.

Sounds good

> > +		return;
> > +	}
> > +
> > +	addr += page_size;
> > +	if (brk(addr)) {
> > +		tst_res(TFAIL, "Cannot expand brk by 2x page size.");
> > +		return;
> > +	}
> > +
> > +	if (mprotect(addr - page_size, page_size,
> > +		     PROT_READ|PROT_WRITE|PROT_EXEC)) {
> > +		tst_res(TFAIL, "Cannot mprotect new VMA.");
> > +		return;
> > +	}
> > +
> > +	addr += page_size;
> > +	if (brk(addr)) {
> > +		tst_res(TFAIL, "Cannot expand brk after mprotect.");
> > +		return;
> > +	}
> > +
> > +	if (brk(brk_addr)) {
> > +		tst_res(TFAIL, "Cannot restore brk to start address.");
> > +		return;
> > +	}
> > +
> > +	tst_res(TPASS, "munmap at least two VMAs of brk() passed.");
> > +}
> > +
> > +static struct tst_test test = {
> > +	.test_all = brk_down_vmas,
> > +};
> 
> No need to repost if you agree with these changes below.
> 
> Kind regards,
> Petr

The changes below look good.

Thanks,
Liam

> 
> diff --git testcases/kernel/syscalls/brk/brk02.c testcases/kernel/syscalls/brk/brk02.c
> index ef84fb440..2e604eb5d 100644
> --- testcases/kernel/syscalls/brk/brk02.c
> +++ testcases/kernel/syscalls/brk/brk02.c
> @@ -1,13 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) 2021 Liam R. Howlett <liam.howlett@oracle.com>
> - *
> - *  Expand the brk by at least 2 pages to ensure there is a newly created VMA
> - *  and not expanding the original due to multiple anon pages.  mprotect that
> - *  new VMA then brk back to the original address therefore causing a munmap of
> - *  at least one full VMA.
>   */
>  
> +/*\
> + * [DESCRIPTION]
> + * Expand brk() by at least 2 pages to ensure there is a newly created VMA
> + * and not expanding the original due to multiple anon pages.  mprotect() that
> + * new VMA then brk() back to the original address therefore causing a munmap of
> + * at least one full VMA.
> +\*/
> +
>  #include <unistd.h>
>  #include <sys/mman.h>
>  #include "tst_test.h"
> @@ -15,38 +18,42 @@
>  void brk_down_vmas(void)
>  {
>  	void *brk_addr = sbrk(0);
> +
> +	if (brk_addr == (void *) -1)
> +		tst_brk(TBROK, "sbrk() failed");
> +
>  	unsigned long page_size = getpagesize();
>  	void *addr = brk_addr + page_size;
>  
>  	if (brk(addr)) {
> -		tst_res(TFAIL, "Cannot expand brk by page size.");
> +		tst_res(TFAIL, "Cannot expand brk() by page size");
>  		return;
>  	}
>  
>  	addr += page_size;
>  	if (brk(addr)) {
> -		tst_res(TFAIL, "Cannot expand brk by 2x page size.");
> +		tst_res(TFAIL, "Cannot expand brk() by 2x page size");
>  		return;
>  	}
>  
>  	if (mprotect(addr - page_size, page_size,
>  		     PROT_READ|PROT_WRITE|PROT_EXEC)) {
> -		tst_res(TFAIL, "Cannot mprotect new VMA.");
> +		tst_res(TFAIL, "Cannot mprotect new VMA");
>  		return;
>  	}
>  
>  	addr += page_size;
>  	if (brk(addr)) {
> -		tst_res(TFAIL, "Cannot expand brk after mprotect.");
> +		tst_res(TFAIL, "Cannot expand brk() after mprotect");
>  		return;
>  	}
>  
>  	if (brk(brk_addr)) {
> -		tst_res(TFAIL, "Cannot restore brk to start address.");
> +		tst_res(TFAIL, "Cannot restore brk() to start address");
>  		return;
>  	}
>  
> -	tst_res(TPASS, "munmap at least two VMAs of brk() passed.");
> +	tst_res(TPASS, "munmap at least two VMAs of brk() passed");
>  }
>  
>  static struct tst_test test = {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
