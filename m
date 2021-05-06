Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E64375073
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 09:56:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A8623C56BC
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 09:56:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 43C673C3157
 for <ltp@lists.linux.it>; Thu,  6 May 2021 09:56:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8B925200A1A
 for <ltp@lists.linux.it>; Thu,  6 May 2021 09:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620287796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n80yWbTMvigh3zezR4glIcAEJbaCa40gw+no6rACstg=;
 b=dNb7F9jUmMI9G05oGYl7yhQmSTXXJUIW0WAJa7a1foEIDOrN+IYgttOxQ8hw2XqS07HCVs
 0XbsNIcj1m/MHb4CxQB9CJzwiDm+jUqdwPyRRZjyF33dCW3EQ4ePALLO9a9B1ij56ELvQs
 XZcBamgyDN2LkH3LvwSRe2YVj5O7+18=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-oHjLDWXVPNa7w4xeBIG_kw-1; Thu, 06 May 2021 03:56:34 -0400
X-MC-Unique: oHjLDWXVPNa7w4xeBIG_kw-1
Received: by mail-yb1-f198.google.com with SMTP id
 m1-20020a2526010000b02904f4d04c0f14so5108345ybm.19
 for <ltp@lists.linux.it>; Thu, 06 May 2021 00:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n80yWbTMvigh3zezR4glIcAEJbaCa40gw+no6rACstg=;
 b=G7/hV9lWdACHaXlZM6ddU9d9N9RhIP847y3TWUYuDdW1c1cXKex4dCbjojsTGKw34m
 uyf4kKhVfgO98Mt3V1hMiVVWT0Pl3opmpRBTsoBtIGrkCUV2tNoK8UZ9lGKIFFAPalAI
 TTaIPhEnoq5CweAuthD86o0Wvj9QHWh8F7FuPj7V+Sz5fdCXr3ewtszpLbIVhJT8zgp7
 IPJjdE0dAbtsnZEjjxj1MJ2JCVtkzK3fJSOiJfSXn/v6TIwEUQBpmSkF0UUEdwpbE3e+
 HzyESzaIY9WfvnIYs3ZFTej2raTblqYEWqZCowzxSkmtb3Tvslk++LBiy7LvuU18m2GH
 9/8A==
X-Gm-Message-State: AOAM531mBHCKWEGZi9Af6VEIVJ9PJCUuAqsIM4A2JqP4Z+h5agD+jsVj
 kCHyIonYWTqkoPlUvET2HOX8CC2VvEQoH3L7JB6j5tYWcQvAbGl5nSK4eA/PYpK+sNHReBYm7Et
 mWwF7/k7e9zS0rH2VR5WBmSDmQts=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr3813016ybp.366.1620287794127; 
 Thu, 06 May 2021 00:56:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS1/ykNVJ7Y4aDAMcm/V7I5373anLfzcgsPVGiSwWtiOTmxLP52IBWc9ruA2g3o+cTsJN9/JiCMDZiWRQ7U/o=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr3812991ybp.366.1620287793877; 
 Thu, 06 May 2021 00:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210504134100.20666-1-rpalethorpe@suse.com>
 <20210504134100.20666-4-rpalethorpe@suse.com>
In-Reply-To: <20210504134100.20666-4-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 6 May 2021 15:56:22 +0800
Message-ID: <CAEemH2dnRA==KvFE73_u4eeqYvWF_+8CjLK=w6D0cv5L+gNBnw@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>, Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 3/7] Add new CGroups APIs
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

Hi Richard,

With my pleasure for patchset:
Reviewed-by: Li Wang <liwang@redhat.com>

Also, the below typos should be corrected (someone who merges these
can help modify).

--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -147,7 +147,7 @@ static const files_t cgroup_ctrl_files = {
        /* procs exists on V1, however it was read-only until kernel v3.0. */
        { "cgroup.procs", "tasks", 0 },
        { "cgroup.subtree_control", NULL, 0 },
-       { "cgroup.clone_children", "clone_children", 0 },
+       { "cgroup.clone_children", "cgroup.clone_children", 0 },
        { }
 };

@@ -158,7 +158,7 @@ static const files_t memory_ctrl_files = {
        { "memory.swap.current", "memory.memsw.usage_in_bytes", CTRL_MEMORY },
        { "memory.swap.max", "memory.memsw.limit_in_bytes", CTRL_MEMORY },
        { "memory.kmem.usage_in_bytes", "memory.kmem.usage_in_bytes",
CTRL_MEMORY },
-       { "memory.kmem.limit_in_bytes", "memory.kmem.usage_in_bytes",
CTRL_MEMORY },
+       { "memory.kmem.limit_in_bytes", "memory.kmem.limit_in_bytes",
CTRL_MEMORY },
        { }
 };


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
