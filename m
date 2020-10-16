Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A55290A2E
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 19:03:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BFAB3C57CF
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 19:03:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D25FA3C247B
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 19:03:14 +0200 (CEST)
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 83A5E201033
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 19:03:12 +0200 (CEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09GH2CJx020701; Fri, 16 Oct 2020 10:03:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=date : from : to : cc :
 subject : message-id : references : in-reply-to : mime-version :
 content-type : content-transfer-encoding; s=facebook;
 bh=iHkWPpiScQ/8BI0mZCGcLk1kT7uRg7EzReB6ENcEhzQ=;
 b=LVAfLpn6AOJZSt+S5WcoGzhAJRbDMYj38cPrCBqj7PoxwSdcChM56TgGtT9EiSoHuG0Y
 Bi/O1T+sWQeOjKcp60Rzny1NkPsvllCdHnOPEIPO1AfvccedCNKPdez540D8Uv26Vyi1
 QOf1Cxb2x5FfPZOdIRk444VwMwHhe1wsGqo= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 346pgsfq4f-19
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Oct 2020 10:03:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 16 Oct 2020 10:02:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExrudKGYYw7f0WGzscIeI9ptiZ3iGWf2NnoCzbbrHv8jASJxFfb1H1U0xkHpKe1r1gEk1ghnJc87K3D3Lc/3mtyn7SCMmxwFS3tMCr/vLlj8CscKdBATmbROTS6gNJ/sUHSbxYRG/TCQiSshglcFR5mSUFxARu2UGVZAWsFXBAMn/PmASZ16IE/yC09rvkoUOgwYdZrS+DBu9rgK1WzF3sAdO0W/PxY64HrjF10lTZ5KQOwV56hFnIkekyrVhq/aWrZexlQjpLQ/oPZpa2nPKMQz74hIZHdNfJv64RT6+yhG1MOT4Zi991faBIlRebO9y/BNLlWrRylcMcCs1YxR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4LtbFYsdoGU0Urhs2PPJc2tqmnhMitjwRlUERg3lBc=;
 b=MxVYZx5+VFQiENB02lGhtzcr0Rj/88YlVHQ2U0VEt+gs4nu0oD7cx53TLM93gDSxLdiVtM/yPoJgqsP2zQwyFYXSZcvhw2UonIJ8yf6VpHrGPovgFA+vjPzTl7Gkj/uAkIV444R2nGy1aWBt17DuI5z8vge/F3PflQI8IFsgbqXhUtIqFdJmGn8ETOYhvG4wqqSDR7xHuh0i+rZ79N1kOWXRUJ1X6bwo9X47CzZ8VHtXDcs8rVF1XMObZbLuTRHZOslglLV32fnv3g8LANIemHymo3wHuefu6Draizpq2+7ccr2xC15gG7RQZCLHHsuQa4Z5WY0/enp/JO0K3MW9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4LtbFYsdoGU0Urhs2PPJc2tqmnhMitjwRlUERg3lBc=;
 b=LVChX+nH1boema7ZTMu65WK07tjppGevbxYz1eN9hFgpr5ScaDJH3E8J7I2n46dcft1+h8U//8yrsK6Rq1r97ELbTWvIwFJWkIzY7OyjNV0UnJdpbWkZQ0LkDW6FoLRzeqPOW0OAey4X+CQerySEWxA3qe3Kfl7seJk2EZnH7kA=
Authentication-Results: cmpxchg.org; dkim=none (message not signed)
 header.d=none;cmpxchg.org; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by BYAPR15MB3157.namprd15.prod.outlook.com (2603:10b6:a03:10b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 16 Oct
 2020 17:02:51 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::d834:4987:4916:70f2]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::d834:4987:4916:70f2%5]) with mapi id 15.20.3477.021; Fri, 16 Oct 2020
 17:02:51 +0000
Date: Fri, 16 Oct 2020 10:02:45 -0700
To: Johannes Weiner <hannes@cmpxchg.org>
Message-ID: <20201016170245.GB230727@carbon.DHCP.thefacebook.com>
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook>
 <20201016145308.GA312010@cmpxchg.org>
In-Reply-To: <20201016145308.GA312010@cmpxchg.org>
X-Originating-IP: [2620:10d:c090:400::5:e7ba]
X-ClientProxiedBy: MW2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:907::40)
 To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.DHCP.thefacebook.com (2620:10d:c090:400::5:e7ba) by
 MW2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:907::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.20 via Frontend Transport; Fri, 16 Oct 2020 17:02:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4f50bfa-32a5-4961-b8f5-08d871f550e6
X-MS-TrafficTypeDiagnostic: BYAPR15MB3157:
X-Microsoft-Antispam-PRVS: <BYAPR15MB3157C671310682C110C9B90BBE030@BYAPR15MB3157.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tcDpFeexD6ztQLbNX8MbsYul3iC9dT92iNwF5RLLu6P72acJguBxxQuJS8HmPH3Y0sQrPoT3pwt2kBOSsTW+XrIRubfkX9Q/07uG9Mr145k684G8rUQzxOhPiHEwQnNqK5xIRa1W5a+X5NS8nVIVqWwOB5Yh7QLSIQIRn6MhTE1E2eXNvAPK/MZODO50hPkrsaTCvEk4cIk+MRfIgwceR4BPHM//orSXT60VN9CkFb0aWn+b1Ho0exlfUq0/Ck82MDI23oRnNbV1/jysLx2npyGwgSdysbkouWGxzp1Hz3akg8nAeP+OuExUBtbzzropIA9M5Bgp4efW1hkCI9ao0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB4136.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(346002)(396003)(366004)(316002)(478600001)(54906003)(6506007)(33656002)(186003)(16526019)(83380400001)(6916009)(8676002)(9686003)(55016002)(86362001)(8936002)(52116002)(66556008)(6666004)(4326008)(1076003)(2906002)(66946007)(66476007)(7696005)(7416002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: FQkCCYMuSirPe4Hb6HR+S8x7TbYfEFW4qzituTqEVUt9qWHT07kaly1prqZcDEY0pgvWXoIvM/WTKUFMKQ2lFthG34jAjIkT28u6odU7iyZhGv/aj4HptHVlXDdQdEeqlmuRStCRJWGdlDlFb1dd9WP5AzBBqdZ6fTX7z6Zza7G+V2LOf5Ya0oMhgTWzOAGx45zL+wPQ1djpDQpr2jDsj8cshntFxRl3vypo+/9jIKn3PK/Odf0K8QJNLpeOzGbF1bs32GoMs/7nqGpLwr2oI4plz/aTZePPdisMjpdIWLmM/UGZKEtlGd2I3yVL6KEcSKJKfaCUq9XkXcgvmz0JPlwYoRv3Vp+Roia2X2LxCY319bLuJZdiuMgmxYqafYZnydsZJGDfqN1180YpCtJScHToLE+aL7g6idXO+dPX0/aozd/hs5gaN2EzGSTY9nNYNijdXpJIlX6vgmbmCMZFWADAJQa5bsQte1OqTop0xmoIX0jqsNSIGL/DVhgPvLUI6S8tg5b5xJqqt62M/U4Mlz3uYTt5hJr6BgE6382Ce2hQBDSlTr5g7II+0y6+W52SXWwTRYCC6TOURMO2NbWkBqE4hQDd/8Im5gy+xpsaLjz3nK2UtZ2grgGJruYTeiqItSWqQ2LJ4dWNDfaLIO3Dl52t/HMtK5zOsbET65ldGnU=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f50bfa-32a5-4961-b8f5-08d871f550e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4136.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 17:02:51.4707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkJA4n+wCyVXcdwk1AjU41Ev/JwIN4MAxZfSrhDRx353T86/JU4yhb+L69E2PMmF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3157
X-OriginatorOrg: fb.com
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-16_08:2020-10-16,
 2020-10-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0
 suspectscore=1 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010160127
X-FB-Internal: deliver
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] mm: memcg/slab: Stop reparented obj_cgroups
 from charging root
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
From: Roman Gushchin via ltp <ltp@lists.linux.it>
Reply-To: Roman Gushchin <guro@fb.com>
Cc: linux-kernel@vger.kernel.org, Richard Palethorpe <rpalethorpe@suse.com>,
 linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Tejun Heo <tj@kernel.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Christoph Lameter <cl@linux.com>, Michal Hocko <mhocko@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Oct 16, 2020 at 10:53:08AM -0400, Johannes Weiner wrote:
> On Fri, Oct 16, 2020 at 11:47:02AM +0200, Michal Koutn=FD wrote:
> > Hello.
> > =

> > On Wed, Oct 14, 2020 at 08:07:49PM +0100, Richard Palethorpe <rpalethor=
pe@suse.com> wrote:
> > > SLAB objects which outlive their memcg are moved to their parent
> > > memcg where they may be uncharged. However if they are moved to the
> > > root memcg, uncharging will result in negative page counter values as
> > > root has no page counters.
> > Why do you think those are reparented objects? If those are originally
> > charged in a non-root cgroup, then the charge value should be propagate=
d up the
> > hierarchy, including root memcg, so if they're later uncharged in root
> > after reparenting, it should still break even. (Or did I miss some stock
> > imbalance?)
> =

> Looking a bit closer at this code, it's kind of a mess right now.
> =

> The central try_charge() function charges recursively all the way up
> to and including the root. But not if it's called directly on the
> root, in which case it bails and does nothing.
> =

> kmem and objcg use try_charge(), so they have the same
> behavior. get_obj_cgroup_from_current() does it's own redundant
> filtering for root_mem_cgroup, whereas get_mem_cgroup_from_current()
> does not, but its callsite __memcg_kmem_charge_page() does.
> =

> We should clean this up one way or another: either charge the root or
> don't, but do it consistently.

+1

> =

> Since we export memory.stat at the root now, we should probably just
> always charge the root instead of special-casing it all over the place
> and risking bugs.

Hm, we export memory.stat but not memory.current. Charging the root memcg
seems to be an extra atomic operation, which can be avoided.

I wonder if we can handle it in page_counter.c, so there will be a single
place where we do the check.

> =

> Indeed, it looks like there is at least one bug where the root-level
> memory.stat shows non-root slab objects, but not root ones, whereas it
> shows all anon and cache pages, root or no root.

I'll take a look.

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
