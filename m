Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E757BA84
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:16:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9CD73C1D48
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:16:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 1A8EC3C194D
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:16:32 +0200 (CEST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2D1961A0123C
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:16:30 +0200 (CEST)
Received: by mail-vs1-f43.google.com with SMTP id h28so45465102vsl.12
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 00:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c1NEltpu13Zh9gBsbVQIGmEQT8g/yPtaHkCK7Sflr2s=;
 b=QIivQFae3gYV3IPPSP4uqVv4G2zdNBozBt2QmoyOt7HfkjuD8q+Irbzqle6nrNsXtH
 dY3zibsYTg91aZu7D+77XHfBF0pYP0UYyL5g7sNAA3Aa03FC0vx6SQi3v5TJoaLvt0bt
 eR27yDVBanVsBND6bh0eornHtw9waZNijBWIc4LNKk4YNY/01PG/ng2S8JeDsbG9b5bx
 FhkpZSij47xzrh+12PJdKKzvnmFA3B8HLICCQlw8f45S5WinxYhuOljwVXMk/rF0C/t2
 a6MMk7X4PzXa4Dj7YKwKOi9h/0C/YRgs7jrVLf/riA0h53LXvsBwB8JwNVEXp5N0d0WB
 0bCg==
X-Gm-Message-State: APjAAAW4CnDe7kH+/WtTKTg8BQrFQzcmfpE4yzb49LwYCMnCR5ct3vDq
 qbmwb/wLip+lbBAucm2RpmInX9WrGPRvHtUjbUqsAWX3KwM=
X-Google-Smtp-Source: APXvYqy/XAuc+fHJfDJAmfnJT5BtWU2DCEPLs2h5OdserGjDXWJ2yVFL0F3BkEWCJlkPm2tOJJyw7jzx6E66msAoB3g=
X-Received: by 2002:a67:1a07:: with SMTP id a7mr71926565vsa.58.1564557388942; 
 Wed, 31 Jul 2019 00:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190731063320.4898-1-pvorel@suse.cz>
In-Reply-To: <20190731063320.4898-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 31 Jul 2019 15:16:18 +0800
Message-ID: <CAEemH2f5XQZw-1hP7ffNYFUtPcBW7TujgkGjN5T0NBa5gnx_AQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] zram01: Fix division by 0
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

> +       if [ $used_mem -eq 0 ]; then
> +               tst_resm TBROK "no memory used by zram"
> +               return
> +       fi

Why not use tst_brkm directly? Otherwise looks good to me.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
