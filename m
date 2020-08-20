Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22E24C118
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 16:57:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3FA73C2FA1
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 16:57:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 59A673C13D8
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 16:57:21 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 957A010000F6
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 16:57:20 +0200 (CEST)
Received: from mail-lj1-f198.google.com ([209.85.208.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k8m0F-00055T-AZ
 for ltp@lists.linux.it; Thu, 20 Aug 2020 14:57:19 +0000
Received: by mail-lj1-f198.google.com with SMTP id y11so447210ljm.0
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 07:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/zWRR2XdgE9LEro2FT+d7ACkUgRFDDkL19jWUYQFRjI=;
 b=jyKgd/zxA4aCeOYjuc87ka4fNVFgbGfQcat1txQ6PmIhllsdYve2bHpA/l2aHdJDa3
 k8RoH1Hmgo+bQ4NSDOpxcWGlL9jL7hSEpnVqlw40MA7dVRz/Sg0DRdiQ9whUL1n73vtH
 ZJ/IR0C53WyCyzSVb6RacgILeXTCemwVRfbZQTuwnRBgukhVwbHwt2g0+Zl6Y3huebnY
 63v/maaqi5dIF/DW+mAgaIpdnDwVxKXNArN8qvI2iYk+/qBRxuVVFWeaTFDE+XmhHr08
 x67wxhx2dCLu8+g9OfH7uSPO1TYbybmSJL81lqwu7yiBn6MCDNfRpreA6Zb/88HNdQWq
 rbOQ==
X-Gm-Message-State: AOAM533zQUxsSgSL5j2lb69g9mmywJJcmKO7M7l3v7xaSbqjVLZfAGM7
 gun/aFxKtWM5GTWzLxxUQO3XnLVJwP3D6EoO2vRNNqDgOpW5+3qubIo3Q3G8glY0kPjzPejfcno
 VWVedflXyPPPz9R23ruYKL+Gf2/VX5Z7ICrCifz+WrNc=
X-Received: by 2002:a2e:9946:: with SMTP id r6mr1777672ljj.35.1597935438260;
 Thu, 20 Aug 2020 07:57:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe49UiVVNPIlEQeFztFMwIokfIlgoNxoDwILr4w6Gvb2wKvrueYJt2x6/vafYaI8GZeUjipc4IOCChG6nbc08=
X-Received: by 2002:a2e:9946:: with SMTP id r6mr1777664ljj.35.1597935438043;
 Thu, 20 Aug 2020 07:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200820133032.16840-1-pvorel@suse.cz>
 <20200820134557.GG9000@yuki.lan>
In-Reply-To: <20200820134557.GG9000@yuki.lan>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Thu, 20 Aug 2020 22:57:06 +0800
Message-ID: <CAMy_GT_0yg4CEW+a8TC-9rrYeNWW0Xa+UsMa70v495WBrUXeBA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/1] tst_kvcmp: Strip double quotes when
 parsing /etc/os-release
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LGTM,
Tested with crafted ID, it can correctly parse the ID with or without
the double quote.

Another thing to note is that I found the loop in tst_kvercmp2 could
iterate outside the size of "vers" and causing
tst_test.c:1298: BROK: Test killed by SIGSEGV!

Reviewed-by: Po-Hsu Lin <po-hsu.lin@canonical.com>

On Thu, Aug 20, 2020 at 9:45 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> Looks good to me.
>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
