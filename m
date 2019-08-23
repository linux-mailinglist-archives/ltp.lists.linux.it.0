Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 817679A7E0
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 08:55:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C5973C1CF9
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 08:55:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E4FE03C1770
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 08:55:40 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5F6C86010BC
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 08:55:41 +0200 (CEST)
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F6EF2CE905
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 06:55:37 +0000 (UTC)
Received: by mail-vk1-f198.google.com with SMTP id d14so3359728vka.6
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 23:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EO7oGFhkzPMeOceZ7xZoXsnFNUuCVmFoN6X4xIj+gns=;
 b=YcqkgsDvbq1sWXnxgbKhU3faRrkROhnN4seY82iHHTJ2wLzktTxoh+i+SwkrTBjw2Y
 eF59mPZ9FZFwNP7YEzqaQhgYQuLyBg6j66i1aYpieIdO5/GL5OAGBUS+2Y9CPJYPFxFw
 Yeu4hxJM8sFAssScuGjMc3aFbJIevyzFiiHQYYiD7PjLSSZxLjxLGRA5mDxqIc75/OJA
 PwbsK8atxUot1v0mH9H4IhkyewwTKhxRGv22g0snhiXliorD2BogI+2xeYlZvgzOXdKj
 h6QZ50w9L4CgGtRemHCkBMR56U61LHN6kQjdDvfJTd9TreRFzy9KdPObflb6RsfdxHK4
 +Ypw==
X-Gm-Message-State: APjAAAVKqsCp3GumIqhxALp92apBo4cJINKirk/9mCcDN43Q1qNXLIRh
 4IRdAu7yTcZfgSYYxpEE9B2RFTtgCJht3O2HNtXuRCNWQAe3F6BG7MWz/xiaymtH9gWQtNvi5D+
 uYp6/oA0XgQx+v6Li1h8kRKgxmCc=
X-Received: by 2002:ab0:2818:: with SMTP id w24mr312107uap.89.1566543336569;
 Thu, 22 Aug 2019 23:55:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwnVmU8IuG5p46wVRsnJM4qs0ckS2HZEooIg/3bhdwYw2BqR7P1QhTPOJsZfYYsSVTcUn8Oi+PRLA7hPikQoJk=
X-Received: by 2002:ab0:2818:: with SMTP id w24mr312100uap.89.1566543336274;
 Thu, 22 Aug 2019 23:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <1566541374-2225-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1566541374-2225-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 23 Aug 2019 14:55:25 +0800
Message-ID: <CAEemH2fT1_ATcKB5bD9OvsnJP1vsRbib_MGyB1Bk_U=Ccd1VVg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02: use .needs_tmpdir and
 MAX_LEN
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

Hi Xu,

Seems you have to apply Petr's patch first, then do a new
modification. Because that patch fixes another compiling issue.

[1] http://lists.linux.it/pipermail/ltp/2019-August/013239.html

--
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
