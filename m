Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B36C34AC60
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 17:14:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22F8C3C8E18
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 17:14:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1C8B33C27F7
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 17:14:04 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5EB206006D8
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 17:14:03 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12QGA9Fp146445;
 Fri, 26 Mar 2021 16:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=mj82UimiK/kmyqeoIfiTJQyVXnkKqba3jD0OfQAp14E=;
 b=EhfWQevyOJCwaqqC93HKeqTd9XYOaC3B+K/A0olT5rlawHu+B5S5G7ROKt5FyFyIwMyQ
 hoiIIy03zfDDhAHtZ570kJJROl9iHylko2G3Eh2S6foXORV9mz/T62INKByRj+zTfojW
 vtRhTJG0nTd6A2puV+G4rrMd4iM51+bGEdVYGyRu5Bwh0++zuMD1IqqSWO5N9YnHre3r
 Gtdzfw1TqCV+zSvPO9IMf5RfKYr/7yn3PcFRHX0QKQTuySnUqdALKs7FlBEfGsyRUu4W
 Jv3fVpf/e/1gX9EUgbB0NWly7NAb44eb2f7UvPlcnM2SRDr/1dFIILqEwjU/BOzJ6Adx Gw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 37h13eamrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 16:13:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12QGAZED107682;
 Fri, 26 Mar 2021 16:13:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by aserp3020.oracle.com with ESMTP id 37h14nah10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 16:13:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5lD0cr/99BU+wRHXSfbjsNIsrlsomhbM+jipUrbG07tOERhY0ESrzV9CXEVMLUQQfSRTzJ6ZqZT6lbFLW92v+JjhefBGOyq7kGdDKBODKdg/qEAFlBXY3iMF9SNkGZ5jJQguTrVprpYxLxKJ3dDyFAhNSzqiImC8KpAZbLDQQS91E2MhtWVCVTO40NUaWSti9Nga1QGF71RiNHZr5CH1yBhPAfClP0qk8VojzrVzBxTSHTyBMKJVzwUTWZafTsAj9zKm1ABX+W2/haGM2AGQ/SVE9bpEkpR5p45dAE/4QNNcYY99nt32vpaHIUe2eqW+wt4bpOx3PxTh94d85foJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mj82UimiK/kmyqeoIfiTJQyVXnkKqba3jD0OfQAp14E=;
 b=HYKWvglUNAhBKtOhtiY2xgQMvn7WmsMyo0HqPoNW9cWUHTY7ID1yZByxPIUrJ7iu4tthah3EXO3Njfj0njN5jemTMoq0LQuAFjiB/upggO2bnjhtrZFP/Vas+nHmUvWRnHHoVkRS2M7BoTLq9rJa/ZbAVDYoAs9wHxzpeXGJoUvb0p6eCRtKq9LS9rEIJ3XQdjIPMD1ft3PhFA3Ke5RBEbugfGOLEZfwg1k/FsqLFBTZnvakYVGdZoRinl2CyUd9RCip/kcXRLT/up9GAKxfMnyUMCseEtCXrJPwxLnr10ER0TihnZ4oEy0g1pDjJOt3T59DgOIkti6fVJBzTmMxnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mj82UimiK/kmyqeoIfiTJQyVXnkKqba3jD0OfQAp14E=;
 b=okAmrg03m7Eh6mJ6WtEP9z/8lAHZHFfln1PtEN55iE0NjH7ypDzkh9qSo5mMGXhnBt4nABDITRkNk8tvYNKSdGtj7KfcyAfxF7UBlcXORg5chhOPft4onDjHsEvR/mlIj9VYkTnaO6WT4C8GOe/20XNl7c8Z/VWwFtSCdBBF3wg=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by CO6PR10MB5426.namprd10.prod.outlook.com (2603:10b6:5:35e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Fri, 26 Mar
 2021 16:13:54 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::1ce7:260b:b004:c82c]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::1ce7:260b:b004:c82c%11]) with mapi id 15.20.3977.025; Fri, 26 Mar
 2021 16:13:54 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one
 VMA
Thread-Index: AQHXCvRm2LPXqQYmf0Wq1gEM3bkluaqIJcyAgAnHDgCAAqFKgIAATeCAgAE9PYCAACptAIAAXGoA
Date: Fri, 26 Mar 2021 16:13:54 +0000
Message-ID: <20210326161348.vcztygn5kb5ki2hn@revolver>
References: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
 <20210224213114.2976705-2-Liam.Howlett@Oracle.com>
 <CAEemH2cKR98HvHZ6OYJpLpaX9-5hfhTak650=DtU-q2Yoo6kbA@mail.gmail.com>
 <20210323162714.t5dm5vbo35vl4t2l@revolver>
 <CAEemH2fnyB_dGzQWUb7SBi9S01vYGXaZBczj2ZwaYF-Rqv9UsA@mail.gmail.com>
 <20210325131545.jwrzhdy474utqjpa@revolver>
 <CAEemH2fOBjn-HkcrDZAam1YZkKLm1rLwOnG-KoGGjRQH59e3Pg@mail.gmail.com>
 <YF26tr2CKGSjRsq5@pevik>
In-Reply-To: <YF26tr2CKGSjRsq5@pevik>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97e8f737-42a4-4b05-1072-08d8f072274f
x-ms-traffictypediagnostic: CO6PR10MB5426:
x-microsoft-antispam-prvs: <CO6PR10MB5426E6F5C67C715B544A4618FD619@CO6PR10MB5426.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FyUianRoCKrdoVCSVUZuR43PRKVFeSIqOPED3YMSgeNEFW+0Oh79OlQFjgS4cBlaDW3YlsM7CF4y+MM3uWTJqszgCWVRK9+8YDpRMGU/Ygaekdg9MYoZRibTZGhUTvAkztRrypzrEww7EbIV3sVjBjJlC4hwh7x0hWE66cy9q+xJHQfPvUouSOIZfGs9Y11You2lEdAig3xnlBjEqGBmfN/RcKGy4BrefimUxdtZ7OfKrQ9cGLMR5a/HpioeSJgB5YIcUx4dqYTIlQKHmrIaTMxHJIQAqBFP11GmhJqYQn9R9Se9o3MeT3yPX7MevdAcl4SexWKyl4KmJJ7IUpVOiezxNzRoy0EsNxUbqgaBwr0D8ZG5iZJ1LCgOLivllBS7vklZ9YAzhxJ3nPV1+9ZVaDrXot4HKyCyxf/WLW8t0ObrRJeiWsEqKy3lnczH0OTkMOWVrgXLzrBxIJrBvJOXY/A2Z5GHlcz0yF1026mGYVzjLwcYNRubJBWLK0LZL2ZF2m563p8zPNOWmDAPFq9ZvsfAeDAHK+4NkHYJakNEEES39Pno82G+MAPUULGlYiEIM7WxDykdzouswemIZ3AVnkPUmzcuRZRrQxXf+0aMBoloIZbIm1GWwSveZh6vetYMQZ7z7qaQul9AMS0MpvsLCxXoHmF+BPLlabxYEfZbWkI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(136003)(39860400002)(396003)(366004)(376002)(346002)(478600001)(54906003)(186003)(38100700001)(26005)(316002)(83380400001)(44832011)(86362001)(33716001)(8676002)(5660300002)(2906002)(8936002)(1076003)(9686003)(6916009)(66476007)(6512007)(4326008)(76116006)(71200400001)(66946007)(91956017)(66446008)(66556008)(6486002)(64756008)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?yrV4rIdt3U++0mbeflnYsrAWtULKL1zkijRdDkhD46refTWKaHqq3yF8fo3/?=
 =?us-ascii?Q?ujedYoOzVHFlQn3xXYeg170ZnspjXTE1O0KNz2dzrWM7FsdodfWnAEXA+G2c?=
 =?us-ascii?Q?U9txHRTlDROngCJQDCiGNhj0DkXLIFK/VReD3HuxT9WfPTnxFWMwVmkSkOLy?=
 =?us-ascii?Q?TX4PChHMXjhFVDOTzREcy7TobckYkZss1F6WmQ0JvFjH4Mqyw+xdsgg48Gq/?=
 =?us-ascii?Q?FLsw1U5HQSYu3rJRjHYEW4OcCJ47imMrvB5iH+A2KAAZUUFrG6d183K25uIT?=
 =?us-ascii?Q?TynNEnf18cj5gCt5bLBgRZA8C/kwOcvKyxlmfW5TNWJVw9gKOTmOHWi2HnFK?=
 =?us-ascii?Q?Nxa0ot9AMcvSABtLJfQCyRwsIMFx8DiXX0Q5CTeOds7XHiG4QKc2EOVoW5cy?=
 =?us-ascii?Q?Kfhv44czbVF9CUEzLih/0LKMoaPYLw6/NDQwA//ZsTBrKVkfX3Ecz8ALchVJ?=
 =?us-ascii?Q?znU/aDJS7PA7a7uXxD9+uZCBtWIyL+WbM4mH3HtRhRCH/QtRdSKrXL34d4BL?=
 =?us-ascii?Q?5NnU56KAggYJfEPabB5RBqqroRx5vMFPFuwydsq6Y8hjJER0uxk2cmeglr/7?=
 =?us-ascii?Q?LFUbUgoIm6312Hm+7PzAcUY8qu/rqdQZm/FYW3UTPWmmOzn/rP116PqJB2+B?=
 =?us-ascii?Q?WO+SmW2jOU1+65oe7KCEGB0Qonlb+mvSJi+K1bHxo9aNU1OFUzm22VCH3yra?=
 =?us-ascii?Q?srPJoFSbfIGjMPxJhCJkh8JKnIbFl6QyYbHf3rMAGmuCTlknCuqTfriyutfu?=
 =?us-ascii?Q?XoJk1Wu5Yn0wLLSiOXe+8SDvk/uPYxs77EmXD3qg6TxOsmCZywXhJs6fKs4Z?=
 =?us-ascii?Q?95v5KeSMIk2/49ha0RHdTajTq4sC291dAQNL4H6lI1zlU5uZgLxlGiqX8tia?=
 =?us-ascii?Q?jZvTVeIcpKjqVL1cRJXiP7YN7gMt9Sj/HMKE5XkJoIuM9yQPXym3BTNpDHTM?=
 =?us-ascii?Q?ilGPtOHYa2Q+fTb8fwk+nWgxfQtrnzoxaqVitPC1uvMDVF+aqmeCmDOi9vFb?=
 =?us-ascii?Q?MOMfRQALCFR9FzdlDcWzG3RZTsgFO7z22DB/jbJcyRW/u7qyD2u/Os5XQmMd?=
 =?us-ascii?Q?CTY/KWHOy5g8wQN3rEuoRISfhP7Kkm1Exyp31t9s7A5ABOxLvGMFhTgt1Mkv?=
 =?us-ascii?Q?T1kGBgIMF28cQa4CVexAvaqalCUs4BJeZ1rlCIMdwhXZU8OtBRJblGndSpJX?=
 =?us-ascii?Q?t0JQZh4v+qVktEQb5PQgroNRHnaWpJca3o0RR1tQ/ch/eVVfHjXJSmuCU4l7?=
 =?us-ascii?Q?b1+csrViyYSJbcIvi6Lra3RlNScsWUvn1xY28lmJMwAnIcTwzS3/h4FwVeJM?=
 =?us-ascii?Q?KeBQTUeHaKbs++6BEsLCL0Xq?=
x-ms-exchange-transport-forked: True
Content-ID: <42443D9814C0A34AA5D17471EB2D8344@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e8f737-42a4-4b05-1072-08d8f072274f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 16:13:54.8296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFEOmXdM5M+oqOzw8B/o13/zF4V79nd3eZpPCnMFpicdZ3uzQlydpEnIdi00M5vSc/6eP6b7Rc+JvU9oyD3YCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5426
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260121
X-Proofpoint-ORIG-GUID: NiCdaBSXlkuREqJ9j_02bOgjcxirstf5
X-Proofpoint-GUID: NiCdaBSXlkuREqJ9j_02bOgjcxirstf5
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260121
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

* Petr Vorel <pvorel@suse.cz> [210326 06:43]:
> Hi Liam, Li,
> 
> > > This was my test platform.  I also sent it to the Travis CI which passed
> > > for x86_64.  I will re-examine the accepted code to ensure the cosmetic
> > > changes didn't invalidate my testing.
> 
> > FWIK, the Travis CI does not run test case, it just compiles/builds LTP
> > across
> > many arches/platforms.
> 
> Yes, while KernelCI and some enterprise / embedded distros for their kernels run
> LTP testcases, the project does not run it. Cyril run some regression tests for
> few most important runtests before release manually. But having a server it'd be
> handy to run them.


Thank you for clarification.  What is the best way to re-test my
changes?  As I had said, I made a change that will not add EXEC but will
still test removal of more than one VMA.  We cannot just mprotect
PROT_READ|PROT_WRITE as this will allow VMA merging to occur.  My
solution is to change the anon vma to just PROT_READ.  It passes in my
x86_64 test but since that was the case for me regardless, I cannot say
that I have fixed the issue, but I have verified that the test still
does what I expect it to do.


Thanks,
Liam

Patch below.
-------------------------------------------

+++ b/testcases/kernel/syscalls/brk/brk02.c
@@ -36,8 +36,7 @@ void brk_down_vmas(void)
                return;
        }
 
-       if (mprotect(addr - page_size, page_size,
-                    PROT_READ|PROT_WRITE|PROT_EXEC)) {
+       if (mprotect(addr - page_size, page_size, PROT_READ)) {
                tst_res(TFAIL, "Cannot mprotect new VMA");
                return;
        }


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
