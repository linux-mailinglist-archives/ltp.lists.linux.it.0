Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 343033DB854
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 14:08:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0E9E3C625B
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 14:08:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 669CE3C232D
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 13:35:42 +0200 (CEST)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4BFC8601C5F
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 13:35:39 +0200 (CEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="298668163"
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; d="scan'208";a="298668163"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 04:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; d="scan'208";a="507948114"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.146.151])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2021 04:35:35 -0700
Date: Fri, 30 Jul 2021 19:35:34 +0800
From: Feng Tang <feng.tang@intel.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20210730113534.GB87305@shbuild999.sh.intel.com>
References: <20210729132514.1699551-1-liwang@redhat.com>
 <20210729132514.1699551-3-liwang@redhat.com>
 <CAASaF6yQkiZVPWpsoo0ZrryBGFdLSGo3kkoejeWcy8dQMSL3yw@mail.gmail.com>
 <CAEemH2cJHtVkaaH5OokAHfVLzPdxU=SqiCf_Gg_ntX_fnWorYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cJHtVkaaH5OokAHfVLzPdxU=SqiCf_Gg_ntX_fnWorYw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 30 Jul 2021 14:08:56 +0200
Subject: Re: [LTP] [PATCH 3/3] mbind01: add more tests for MPOL_LOCAL
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,



On Fri, Jul 30, 2021 at 04:03:28PM +0800, Li Wang wrote:

[....]
> On Thu, Jul 29, 2021 at 10:20 PM Jan Stancek <jstancek@redhat.com> wrote:
> >> @@ -101,6 +101,20 @@ static struct test_case tcase[] = {
> >>                 .test = test_default,
> >>                 .exp_nodemask = &nodemask,
> >>         },
> >> +       {
> >> +               POLICY_DESC(MPOL_LOCAL),
> >> +               .ret = 0,
> >> +               .err = 0,
> >> +               .test = test_none,
> >> +               .exp_nodemask = &empty_nodemask,
> >> +               .check_policy = check_policy_pref_or_local,
> >>
> >
> > This is a bit more permissive, it allows for MPOL_LOCAL to return also
> > MPOL_PREFERRED.
> > Shouldn't that still be treated as error?
> >
> 
> To strictly this should be an error.
> 
> But I slightly think that it's acceptable to get 'MPOL_PREFERRED' on the old
> kernel (i.e. 4.18.0, v5.13) because 'MPOL_LOCAL' is not treated as a real
> policy.
> And the situation exists for quite a long time.
> 
>   7858d7bca7fb ("mm/mempolicy: don't handle MPOL_LOCAL like a fake
>   MPOL_PREFERRED policy")
> 
> Without this kernel commit, looks like the MPOL_LOCAL will convert to
> MPOL_PREFERRED in mpol_new.
> 
> SYSCAL_DEFINE6(mbind, ...)
>  kernel_mbind
>   do_mbind
>    mpol_new
>      ....
> 
> # cat mempolicy.c -n
> 
>    287          /*
>    288           * MPOL_PREFERRED cannot be used with MPOL_F_STATIC_NODES or
>    289           * MPOL_F_RELATIVE_NODES if the nodemask is empty (local
> allocation).
>    290           * All other modes require a valid pointer to a non-empty
> nodemask.
>    291           */
>    292          if (mode == MPOL_PREFERRED) {
>    293                  if (nodes_empty(*nodes)) {
>    294                          if (((flags & MPOL_F_STATIC_NODES) ||
>    295                               (flags & MPOL_F_RELATIVE_NODES)))
>    296                                  return ERR_PTR(-EINVAL);
>    297                  }
>    298          } else if (mode == MPOL_LOCAL) {
>    299                  if (!nodes_empty(*nodes) ||
>    300                      (flags & MPOL_F_STATIC_NODES) ||
>    301                      (flags & MPOL_F_RELATIVE_NODES))
>    302                          return ERR_PTR(-EINVAL);
>    303                  mode = MPOL_PREFERRED;    <--------- this line has
> been removed after the commit
>    304          } else if (nodes_empty(*nodes))
>    305                  return ERR_PTR(-EINVAL);
> 
> But maybe I was wrong here, CC FengTang in case he has suggestions on this.

Yes, you are right. With the commit MPOL_LOCAL will be taken as a real
policy, be MPOL_LOCAL itself, and not a fake MPOL_PREFERRED.   

Faking MPOL_LOCAL as a MPOL_PREFERRED makes the semantic very confusing, 
and the kenrel code is also very confusing and difficult to be maintained,
as there are many ambiguous logic to check this faking and transform the 
policy back and forth. So we chosed to clean it up.

Thanks,
Feng

> 
> >
> >> +       if ((tst_kvercmp(3, 8, 0)) < 0 && (tc->policy == MPOL_LOCAL)) {
> >> +               tst_res(TCONF, "%s is not supported",
> >> tst_mempolicy_mode_name(tc->policy));
> >> +               return;
> >> +       }
> >>
> >
> > I was thinking of runtime check (to support also downstream kernels that
> > backported it),
> > but I don't have strong opinion.
> >
> 
> Thanks, I assume there is little probability to backport it.
> 
> -- 
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
