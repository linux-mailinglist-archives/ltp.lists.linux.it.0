Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C63B29367F
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 10:12:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A08E73C56D3
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 10:12:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E70A93C242F
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 16:54:46 +0200 (CEST)
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3464310013B2
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 16:54:46 +0200 (CEST)
Received: by mail-io1-xd44.google.com with SMTP id d20so4114078iop.10
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 07:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=P+wWygljj49b/Jwoyua6AHD+Ku/LFmb5gdhqTAfvLEg=;
 b=LfWcB5jJyrh0MulkzzuGDm88OUPUpKQE8o53FteBypfuv4DTJIqcilO5fbMfXFgYXI
 lNzpYppun7sYKDcWP9drg2dRRpqy3ivRLLdyLTh5O5yrcim1D+Rl1p43Fc8Ww1Dlnq75
 UduIWxVs7cKdmtuQ99t4hyO12AovSFAZgo1uUGJ5obm0Il7FaQHkzj9QMdXK9zopXcSF
 PLwlynbaqdXAtnJzQ89MJ+Lzr1Vb/40fbGXEsslJk7dWbQwUd777LR4USiIBmWG9Zm6f
 7A4U32UBKsGWK71FaDROAEtzkzsNLPZWM6FOj2Bt9j8CrzMDRFddJUzI7S5C99xjuZd5
 KqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=P+wWygljj49b/Jwoyua6AHD+Ku/LFmb5gdhqTAfvLEg=;
 b=eiR8A4TBgcFXgwFx+CW1vEk+V4Uzoy5AAjeHCUW+dc68EpUiTbWlErcQTlikXLobq1
 XoeTeX4UVIjTELbrnwjf60IEIldm6+CYMT4E4MKtIpCNnRMAQoxn7SIqN7MKokOP8Wwf
 zfsRgouUkIJRznP5uKNZrQ222wVhGdyPvoK0uKrPe9fKq9TaR784p5LuCAyIzvuxRq+M
 Z4JKP40G1LtRH59J2Y0FlFdjwKueZZfimpADm3HrnLWWrn2hddzPJFwXCeEAHyPcDm2E
 DfMUXpBaCBHxpIRSjRxprwc2GxOC2MhH0voB9TUidb2YQQEHlZpHgMQNNEJlDCeV4aEg
 vAgQ==
X-Gm-Message-State: AOAM530cs2MXdKldimsA6H5TBk0RpIRla8IC2lEFN03oWQxVGqH4oDTo
 K1zOF3nYrGx0OF3ZF30EWxkS1Q==
X-Google-Smtp-Source: ABdhPJzFogEG6IQkoTlKAgWk1KT+gJK3ZP6L/JPWVdkauPYFnSZXzWhrRw9D+btj4vw97vn8oJI+tQ==
X-Received: by 2002:a02:9441:: with SMTP id a59mr2934832jai.122.1602860084430; 
 Fri, 16 Oct 2020 07:54:44 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:b51d])
 by smtp.gmail.com with ESMTPSA id b14sm2815853ilg.63.2020.10.16.07.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 07:54:43 -0700 (PDT)
Date: Fri, 16 Oct 2020 10:53:08 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Message-ID: <20201016145308.GA312010@cmpxchg.org>
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016094702.GA95052@blackbook>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 20 Oct 2020 10:11:56 +0200
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
Cc: linux-kernel@vger.kernel.org, Richard Palethorpe <rpalethorpe@suse.com>,
 linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <guro@fb.com>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Oct 16, 2020 at 11:47:02AM +0200, Michal Koutn=FD wrote:
> Hello.
> =

> On Wed, Oct 14, 2020 at 08:07:49PM +0100, Richard Palethorpe <rpalethorpe=
@suse.com> wrote:
> > SLAB objects which outlive their memcg are moved to their parent
> > memcg where they may be uncharged. However if they are moved to the
> > root memcg, uncharging will result in negative page counter values as
> > root has no page counters.
> Why do you think those are reparented objects? If those are originally
> charged in a non-root cgroup, then the charge value should be propagated =
up the
> hierarchy, including root memcg, so if they're later uncharged in root
> after reparenting, it should still break even. (Or did I miss some stock
> imbalance?)

Looking a bit closer at this code, it's kind of a mess right now.

The central try_charge() function charges recursively all the way up
to and including the root. But not if it's called directly on the
root, in which case it bails and does nothing.

kmem and objcg use try_charge(), so they have the same
behavior. get_obj_cgroup_from_current() does it's own redundant
filtering for root_mem_cgroup, whereas get_mem_cgroup_from_current()
does not, but its callsite __memcg_kmem_charge_page() does.

We should clean this up one way or another: either charge the root or
don't, but do it consistently.

Since we export memory.stat at the root now, we should probably just
always charge the root instead of special-casing it all over the place
and risking bugs.

Indeed, it looks like there is at least one bug where the root-level
memory.stat shows non-root slab objects, but not root ones, whereas it
shows all anon and cache pages, root or no root.

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
