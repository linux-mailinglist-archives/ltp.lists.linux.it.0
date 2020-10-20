Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 385C22940E6
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 18:55:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDAE13C31E4
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 18:55:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DE9333C202D
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 18:55:50 +0200 (CEST)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7EA4D10005A0
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 18:55:50 +0200 (CEST)
Received: by mail-lj1-x244.google.com with SMTP id y16so2812275ljk.1
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=buGW0O0c+InVLuoUUk4CrqPPjYxIlROTH5UiCLGLQrA=;
 b=EyVIFhUR+vfjItI8v3zK8T9hgH1qJLGNMdDt9Sagc57TYoW3GYcuL2ArDX8hRTtv3W
 d336nsW8UK7UCgl8Ysrd+yQW1zn4nYjB6feBlVbYJ66KuTKhwZLozyq0HzQEuG5i6APj
 WMr6T5fW4l0vwUu52R38Y4mwQGUithzZDB8GDBuD5jxi+ntd1LWktkBxsKbrgaMVKE/y
 hOqvyNkNQOL/OfuJ5dnsw3Xh05LqPtjLxW4W+M5YVVxVurJ6zLQNOfxu1JqNawa4SYDY
 +zlPzhp3cjslOGTbW+uvbUIr8IUTqmQQIYzzAeOqb5eonAKy4AI5JEP8lJvdzbgnJ0bY
 th2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=buGW0O0c+InVLuoUUk4CrqPPjYxIlROTH5UiCLGLQrA=;
 b=UFaov/PypNvWyoT/UYW+1PVV9Ji+hBTAH5aZofX1LVP1LMEYp8h5EVLXmcy3L0mHAA
 6DD4oQvmzmK6LYOzbUfx2CBhZ2tApVsl/MZ9scsDHoB0kBj5FBu8F59klUlNrLMXZcza
 hLi5GanhXnV67/SF1WnRVCwkY8u1ain628gYyD/pomreKbWlgnrWL8C7Kaj8O6YvjkM4
 vME3R2JPBxUOwCYI2UQ4pppXWgqTNZEqs9fI3zoD61xIAV8aQt2nx7vfVqqMPRVZkLV/
 FBtvxF9nIiaE7ivDO3dEI0WxxTdwUOO3wOLEcwg/ov3LdoUA1szpJoMETiNrFk7BhN3n
 RNNw==
X-Gm-Message-State: AOAM532QKjefMmbCRF37iAO4oSYvm/eHK1bdS2xQjriTrtAZc4JnbBWg
 adXArTlmzaT7iTyY3m5uOPPl89gNuLuvqjQDqBncGw==
X-Google-Smtp-Source: ABdhPJwFABKkDYQUVhWxC8A5aUlf2eaKKjOkQxmcJkfbzgyahjid0WWNFsVS8Oxbv0WWn+/jNA7xVdk7wg9Fh52vTkg=
X-Received: by 2002:a05:651c:1af:: with SMTP id
 c15mr1668396ljn.446.1603212949514; 
 Tue, 20 Oct 2020 09:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook>
 <20201016145308.GA312010@cmpxchg.org> <20201016171502.GA102311@blackbook>
 <20201019222845.GA64774@carbon.dhcp.thefacebook.com>
In-Reply-To: <20201019222845.GA64774@carbon.dhcp.thefacebook.com>
Date: Tue, 20 Oct 2020 09:55:38 -0700
Message-ID: <CALvZod66ETQR2rKhZQfEZwdovuF0AaVTZ1g1JNjkLgLGgMKY8g@mail.gmail.com>
To: Roman Gushchin <guro@fb.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
From: Shakeel Butt via ltp <ltp@lists.linux.it>
Reply-To: Shakeel Butt <shakeelb@google.com>
Cc: Michal Hocko <mhocko@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Richard Palethorpe <rpalethorpe@suse.com>, Linux MM <linux-mm@kvack.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Oct 19, 2020 at 3:28 PM Roman Gushchin <guro@fb.com> wrote:
>
> On Fri, Oct 16, 2020 at 07:15:02PM +0200, Michal Koutny wrote:
> > On Fri, Oct 16, 2020 at 10:53:08AM -0400, Johannes Weiner <hannes@cmpxchg.org> wrote:
> > > The central try_charge() function charges recursively all the way up
> > > to and including the root.
> > Except for use_hiearchy=0 (which is the case here as Richard
> > wrote). The reparenting is hence somewhat incompatible with
> > new_parent.use_hiearchy=0 :-/
> >
> > > We should clean this up one way or another: either charge the root or
> > > don't, but do it consistently.
> > I agree this'd be good to unify. One upside of excluding root memcg from
> > charging is that users are spared from the charging overhead when memcg
> > tree is not created.  (Actually, I thought that was the reason for this
> > exception.)
>
> Yeah, I'm completely on the same page. Moving a process to the root memory
> cgroup is currently a good way to estimate the memory cgroup overhead.
>
> How about the patch below, which consistently avoids charging the root
> memory cgroup? It seems like it doesn't add too many checks.
>
> Thanks!
>
> --
>
> From f50ea74d8f118b9121da3754acdde630ddc060a7 Mon Sep 17 00:00:00 2001
> From: Roman Gushchin <guro@fb.com>
> Date: Mon, 19 Oct 2020 14:37:35 -0700
> Subject: [PATCH RFC] mm: memcontrol: do not charge the root memory cgroup
>
> Currently the root memory cgroup is never charged directly, but
> if an ancestor cgroup is charged, the charge is propagated up to the
> root memory cgroup. The root memory cgroup doesn't show the charge
> to a user, neither it does allow to set any limits/protections.
> So the information about the current charge is completely useless.
>
> Avoiding to charge the root memory cgroup allows to:
> 1) simplify the model and the code, so, hopefully, fewer bugs will
>    be introduced in the future;
> 2) avoid unnecessary atomic operations, which are used to (un)charge
>    corresponding root page counters.
>
> In the default hierarchy case or if use_hiearchy == true, it's very
> straightforward: when the page counters tree is traversed to the root,
> the root page counter (the one with parent == NULL), should be
> skipped. To avoid multiple identical checks over the page counters
> code, for_each_nonroot_ancestor() macro is introduced.
>
> To handle the use_hierarchy == false case without adding custom
> checks, let's make page counters of all non-root memory cgroup
> direct ascendants of the corresponding root memory cgroup's page
> counters. In this case for_each_nonroot_ancestor() will work correctly
> as well.
>
> Please, note, that cgroup v1 provides root level memory.usage_in_bytes.
> However, it's not based on page counters (refer to mem_cgroup_usage()).
>
> Signed-off-by: Roman Gushchin <guro@fb.com>

This patch is only doing the page counter part of the cleanup (i.e. to
not update root's page counters when descendent's page counter is
updated) but not the stats part.

For the user memory, we do update the stats for the root memcg and do
set page->mem_cgroup = root_mem_cgroup. However this is not done for
the kmem/obj. I thought this is what Johannes was asking for the
cleanup.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
