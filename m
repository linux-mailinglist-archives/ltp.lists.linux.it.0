Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F331D2967CB
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 02:00:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6609B3C569C
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 02:00:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A919B3C318C
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 02:00:09 +0200 (CEST)
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1209A200DB1
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 02:00:09 +0200 (CEST)
Received: by mail-lf1-x142.google.com with SMTP id a9so4409310lfc.7
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 17:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iDXB6MzIAjPa6Z+bYdtdThdhAzUe/hH836F46Z6tXhw=;
 b=guRkvILP5wkBF+Y8oh3Zj7febDKb+DRU+Ww1jYwe0hatSbkoSvbf2KK84bXYRPYpEc
 UcIAxUjcnJZrINp5BGV6sKtKGNlAG6k3n3FkO8x4H/85YVV7SR/705oDXmT5x3d0yhVZ
 mG6PuVtvKHPX8zk3WDn7PAnWbJx9bjuy7E08MCpKuK2f7ke3p5BXY9C2tUa6TY/xPrMM
 8qsv+MYRUGERFLfHpupKVI1x3jOXVV9VUezVFFIPeMf+nK0oIbHJevGLpn5M5RnUCXqI
 FgiXurXdocx0CUIqiFWILkvklKd3RHDh47dcC4y37Yo+GN5Ns+yckbpjeJjxnoSZ8MRo
 pzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDXB6MzIAjPa6Z+bYdtdThdhAzUe/hH836F46Z6tXhw=;
 b=TuuvpPTfUQHxi+N4hBYWOViA+RUjO9se48E2NeeLxbbfPZbXqfj9A3tJSQgcsr8FUT
 DZ6RFuMfwpaCn8dZyNBBp2OmrJlv/iJB/23N7CZNyYocp1cZ3AkfAaTnktw6ObDCMIe8
 z1DTWVKpjcORsfXLRYQR14bArT5y1nXU0fuzmkqzUnappvCSu0O/Ab9lVNEnMros6elA
 iMU30WWHMTDzVg0eQBilL3IOkLdy4mU7IlPKESYxhXwJ2GBEvOrmmsFHg+OA2XEqJbTw
 yCnGmelDOLcWe7HxCYm+XewpYAi8JBrsjaI/p8LrUdHutEz+I6PRNNc3JlHigeYFVxo9
 I48w==
X-Gm-Message-State: AOAM532kuM2XzRphJSHkoCeJ30j9JADGNN8u28LhaWtAR07DbD6r1zDI
 /+DQXr+fILJGcQbDZ0a0Qw23Z/GG3G/kxBKV9zNJLg==
X-Google-Smtp-Source: ABdhPJzuULwrnVGAGtEgdR0cHZymQzvgHmTA54WaDGuHfGCXTVu1rVTxbqmOoQxfxggqrA9eJa1zXMFPgmAY7VgAR18=
X-Received: by 2002:a19:7ed8:: with SMTP id z207mr577866lfc.54.1603411208087; 
 Thu, 22 Oct 2020 17:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <87sga6vizp.fsf@suse.de>
 <20201022122858.8638-1-rpalethorpe@suse.com>
 <CALvZod4u79DSwyM=Kg8g5tR1L5eomHgUkaJmp6s9D3jC7OnN0A@mail.gmail.com>
 <20201022172508.GF300658@carbon.dhcp.thefacebook.com>
In-Reply-To: <20201022172508.GF300658@carbon.dhcp.thefacebook.com>
Date: Thu, 22 Oct 2020 16:59:56 -0700
Message-ID: <CALvZod5p-O72gCY-R+oLcDZjEkPRioz7e7p5Jg=nXxhmtiwKWw@mail.gmail.com>
To: Roman Gushchin <guro@fb.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] mm: memcg/slab: Stop reparented obj_cgroups
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
Cc: Christoph Lameter <cl@linux.com>, LKML <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 22, 2020 at 10:25 AM Roman Gushchin <guro@fb.com> wrote:
>
[snip]
> >
> > Since bf4f059954dc ("mm: memcg/slab: obj_cgroup API") is in 5.9, I
> > think we can take this patch for 5.9 and 5.10 but keep Roman's cleanup
> > for 5.11.
> >
> > What does everyone think?
>
> I think we should use the link to the root approach both for stable backports
> and for 5.11+, to keep them in sync. The cleanup (always charging the root cgroup)
> is not directly related to this problem, and we can keep it for 5.11+ only.
>
> Thanks!

Roman, can you send the signed-off patch for the root linking for
use_hierarchy=0?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
