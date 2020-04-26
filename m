Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2690D1B926F
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Apr 2020 19:45:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EC0F3C604C
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Apr 2020 19:45:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B84333C2884
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 19:45:34 +0200 (CEST)
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BBDA51A00988
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 19:45:33 +0200 (CEST)
Received: by mail-lf1-x144.google.com with SMTP id 131so11827152lfh.11
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NhfmNbpoua12nkQLRWqMQ42xHqPthmCD94K/R9Vvam8=;
 b=WN7+F69IoVGLnPR+mBfmh3Lh6UKj/N2KdBRpP4wMiRNr4Xk2F3InWJpHcOEqo5IH3l
 tV1r3Y7GPftgLkQUDIer0xAI9AAr6SDquCRsKrogBfdD9BZ9z8mQK0MvMuYGisjKYJL5
 jvv0aAg6kOuGa3VKh35adzvWUgIYxPtga5eoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NhfmNbpoua12nkQLRWqMQ42xHqPthmCD94K/R9Vvam8=;
 b=DjnYtn1oLvXpmfYIUGwLzcIfvgOIjZt1YSu0Z/X0jlYbke5cMbIXjEwrFQ4LOkqwP+
 mRfi+SZIxB2IUMiGItgrdfSTRAvjIz7sricZt7UzB2c9j6h00RjLzoAPIDANy1TFXDzy
 Few69M2fedFXPVvEYFWCr7l9TGHhLh7ap/WetmzGJjuJ3nCGzHA6Sxv5o/PM2IMBwtNt
 QQujJw4sZ0hzLSPQF+mkR7EMa7pJDm3zpMMbqjEVTKgxPQWtpj2VPtNYNs7ZrV35m7LM
 dEST+uO2w3X5knHzrXqYsCD7XSkwCkPD4lOVApsylIGBX4Z9mXUY04gT/GBH/zoQpxve
 74TQ==
X-Gm-Message-State: AGi0Pub+POY/+UWx40+YxeAWplODTH+j8beBgP80SzQe5UdD93hS5Jhl
 0lSKjkxwrBdrNDWqYRzl3KGnqIDrOfM=
X-Google-Smtp-Source: APiQypKgLPV+gBuCXsvDI1foPPs0tQBAnzMyW7h7ZtSnAlZ2IT6f5E7Fi0NjN39UN6G1MmQazi5O9A==
X-Received: by 2002:ac2:519c:: with SMTP id u28mr12915946lfi.17.1587923132661; 
 Sun, 26 Apr 2020 10:45:32 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id q16sm8383418ljj.23.2020.04.26.10.45.31
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Apr 2020 10:45:31 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id k28so11857845lfe.10
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 10:45:31 -0700 (PDT)
X-Received: by 2002:a19:240a:: with SMTP id k10mr13109086lfk.30.1587923131294; 
 Sun, 26 Apr 2020 10:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587552329-21738-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2ea_CtRyP9KtpJDjpEzobRyhrodiycDCAxhLbCjuOwhCQ@mail.gmail.com>
 <662aa817-04ff-e924-6880-7c23fa1cfe31@cn.fujitsu.com>
 <CAEemH2cF-kziNEHuN1GayTtzwdxFFzsu0wRGB85yJ=LaKS-XBw@mail.gmail.com>
 <3268f153-6730-708f-ed93-19ca4cf85fdd@cn.fujitsu.com>
 <CAEemH2ee7c55=EQb5qohpu40XMACSOCrSStwWt7u=_GyqjrxLw@mail.gmail.com>
In-Reply-To: <CAEemH2ee7c55=EQb5qohpu40XMACSOCrSStwWt7u=_GyqjrxLw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 26 Apr 2020 10:45:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg7u4AjZQd49VjrZXikDMfK-HchOKHYqoUFwcXjsbJ3XQ@mail.gmail.com>
Message-ID: <CAHk-=wg7u4AjZQd49VjrZXikDMfK-HchOKHYqoUFwcXjsbJ3XQ@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
Cc: David Howells <dhowells@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sun, Apr 26, 2020 at 4:59 AM Li Wang <liwang@redhat.com> wrote:
>
> From kernel code seems you are right. The pipe indeed takes use of PAGE_SIZE(ppc64le: 64kB) to split the writes data in the packetized mode (marked by O_DIRECT). But in the manual page, O_DIRECT indicates us the PIPE_BUF is the correct atomic unit.

The manual is correct.

PIPE_BUF is the size we _guarantee_ can be used atomically.

The fact that in practice we do have bigger buffers on some platforms
is an implementation detail.

Yes, that implementation detail can be visible, but basically any test
code that tries to test for "what if we use a bigger bug that
PIPE_BUF" is buggy. It's simply not guaranteed to work any more.

O_DIRECT is kind of immaterial, except it's just one of those things
where the atomic size is slightly more visible. But basically,
packetized pipes with bigger packets than PIPE_BUF is random behavior.
It may work. It may not.

                Linus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
