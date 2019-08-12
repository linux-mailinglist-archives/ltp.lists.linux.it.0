Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDBD89675
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 06:53:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABB723C1D2F
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 06:53:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 77E6B3C0886
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 06:52:57 +0200 (CEST)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3AAFF60081D
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 06:52:59 +0200 (CEST)
Received: by mail-vk1-f196.google.com with SMTP id b11so1339526vkk.10
 for <ltp@lists.linux.it>; Sun, 11 Aug 2019 21:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IO6mUDXlPq5kINB8POeruomKyLTPZ5on+My8erDfdaQ=;
 b=osfDBN+WudUy7uUUv9656RJERFz9sULkY5Pu0kQHrrc15qiJ6UWscgE5zMT3nSfR6W
 NVavLHd/F1VfumEhLJvZpTGihlUmO3R2in9/CMDwkWeGrlKEaY8qhCVZ48PpOFnXth9Y
 XWLqBcefeNhnHAL58Ucyc2Pu82vXiP1K3YJZB385NZq+tFPXA2F61h7ujn9bpIq0dbUA
 oiI/H/pOQ/ga87yFapXsajgIQn8QQ2OVKESNnMDh2uebg1gv6+z1Exs2Fl4/0Gm/KVGD
 AhHMjOukirx+o56dQJOA6l2TOYoJmDRq1dXsGeZgxwKXc7STgS2Ras1KSngyzVUMO4K2
 cCaQ==
X-Gm-Message-State: APjAAAU4MqUcWemh52are2HmxjjoB+0WEZCAjFrjxQzk164b2MGqrG3S
 oDAcXiiRqGqrPovx2ts3iEprV3JO2uhWRawrdWupsA==
X-Google-Smtp-Source: APXvYqz8aWwIBi/Fu3J60eguTlBGhYBlL6LhMaoh0zPmGNY0yqq1JuM3uP18Gr86Fh5iQJP2ViKYYzuMf3LRxLSpUQU=
X-Received: by 2002:a1f:cf42:: with SMTP id f63mr7093441vkg.91.1565585575359; 
 Sun, 11 Aug 2019 21:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <ee463189a82212a10c1ac06229dc0a418e18305b.1565361031.git.jstancek@redhat.com>
 <e4c5428276c9a85efc6bddaa2d82e2aed5806108.1565361031.git.jstancek@redhat.com>
In-Reply-To: <e4c5428276c9a85efc6bddaa2d82e2aed5806108.1565361031.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 12 Aug 2019 12:52:44 +0800
Message-ID: <CAEemH2dhCdL5uUYxaf9_sYWqf=q+VqgmZofE0AfDm8DuXaO-ng@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] clock_getres01: add test variants
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

On Fri, Aug 9, 2019 at 10:32 PM Jan Stancek <jstancek@redhat.com> wrote:
>
> 0 - default, could be either VDSO or syscall
> 1 - syscall with valid res parameter
> 2 - syscall with NULL res parameter
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
