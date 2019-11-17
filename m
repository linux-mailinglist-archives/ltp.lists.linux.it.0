Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C55FFF8B5
	for <lists+linux-ltp@lfdr.de>; Sun, 17 Nov 2019 11:04:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2ED13C1CAD
	for <lists+linux-ltp@lfdr.de>; Sun, 17 Nov 2019 11:04:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 96BEE3C1C9A
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 11:04:04 +0100 (CET)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3286D1A014F1
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 11:04:04 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id 8so15525809wmo.0
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 02:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NojNExrtWL/nf0PKQfW7eBMS4z5mhvLKhbYhuyNWCeI=;
 b=FpOhk58gIycfCz7eAJ4oBDRi+33CMM/5wi5KGUUgHug+g5/fKmSj2eHLcmBePlr74k
 kl/HnU2MkSUPDFsWgfGYUfJT5/q3tWC5zo5RsHcr+D3hfs25HRj6W66gE6cza1nznLF4
 BTjU+bhrXHUxQOltXwcfVKbXrJn+bhD4rtsE577fvmMOJS15+WOXxzKzErAbC8kZHf3v
 SUxeLe0WsHlQQ8ZWKfCt6vGL7P39XEYVSrYBXI1NMAXchDAUepbR5xi2iUPRsNThPzAJ
 ZFrvfySdPfmyX9y6oSnFCSPmmrtFjeKIpylcmteAFqXjTe+xYPCYNezY+252oIeW+jTU
 WFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=NojNExrtWL/nf0PKQfW7eBMS4z5mhvLKhbYhuyNWCeI=;
 b=PwfEVJzNQNj5I/TRsBhjlJFrrMdM2a80zQde777bb0YjAXK7yzpJJxIuf8lf1IqUz5
 kxeLZhPAz0f0NRmEzvYu0QSHs5kvIirkLRTXybjILXLryTYrQUTQ9t77Z16tTaw0CN9f
 MAZgGNDdBgNAifC8uSQX/1C9stkUAMubsUwmxWQJxkKNzEuP0LZN5O5DHDvZfK8YxHXp
 mbYFAOAFG2nZg/eaeFtEgiiHq3g+PnggTPKqFV/UJ5LJipJFWbWfT7/wuFDwzEvzKOZO
 K9jj8gB/DWLJjpqKlOd6/UhAo4Lgytm/U9qxEjszAXWaX3sOPlcF//bMCjkfirtXxTQJ
 /WCg==
X-Gm-Message-State: APjAAAVCf+DC3IgJENNeo0TfRtCsuFmr9bm9Oys4yLf+gU/38u3pvwYP
 ITIwJBxlwxu8ztJAOE6UCzM=
X-Google-Smtp-Source: APXvYqysK8EYyihIcthQc4c3C4ijWtXzbj1EJP8zZjzTwo781KzAV6KNsTvR+yPeOSwAgQR8DotHNg==
X-Received: by 2002:a1c:3d08:: with SMTP id k8mr22349362wma.119.1573985043828; 
 Sun, 17 Nov 2019 02:04:03 -0800 (PST)
Received: from x230 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id b186sm15704364wmb.21.2019.11.17.02.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 02:04:03 -0800 (PST)
Date: Sun, 17 Nov 2019 11:04:01 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191117100401.GB22986@x230>
References: <20191116002003.13013-1-petr.vorel@gmail.com>
 <977310824.12699736.1573924977430.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <977310824.12699736.1573924977430.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fanotify: Fix for musl
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

> ----- Original Message -----
> > FSID_VAL_MEMBER() wrapper was meant to be only for struct
> > fanotify_event_info_fid, it was used also for struct event_t
> > (which has also __kernel_fsid_t fsid, but shouldn't be redefined).

> > This caused error on recent musl v1.1.23 (with f67b3c17),
> > which has struct fanotify_event_info_fid.

> > Fixes: 0498fc0a8 ("fanotify: Detect val vs. __val
> > fanotify_event_info_fid.fsid member")

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

> If it's needed for __kernel_fsid_t we'll need to come up with better names.
+1. But hope this is not needed.

> This basically reverts part of previous patch, which looks ok to me.
Yep. I'll add this to commit message, to be obvious.

> Acked-by: Jan Stancek <jstancek@redhat.com>

Thanks for your review.
I'll wait with merge till Monday (if Cyril has some comments).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
