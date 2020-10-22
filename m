Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C01295675
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 04:36:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DC663C56C6
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 04:36:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 946893C269A
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 04:36:35 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C558C600EB8
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 04:36:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603334193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fTNiPOTZ6ISHxHtR3c82E/VESUpk1K8zgzZCTw+gct4=;
 b=i9FgCyaqgbbosIqlnAMIsbLXqBIuJadcpiAAcofwZXBTWK6C0dqevrDZB4beU5jn22szw3
 i/OODzfcOSNR1uX9w4vaqXS44yJumPZ1Ihq8efmss5r3qQdSgBAOQGNJYJuA7r9lfvS8tL
 v0mb7PqNn0gDpOg5OCgRx6YC+j5gW1Q=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-Hlone3gdOFGwgfDAHwnGZQ-1; Wed, 21 Oct 2020 22:36:30 -0400
X-MC-Unique: Hlone3gdOFGwgfDAHwnGZQ-1
Received: by mail-yb1-f199.google.com with SMTP id h6so242495ybk.4
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 19:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fTNiPOTZ6ISHxHtR3c82E/VESUpk1K8zgzZCTw+gct4=;
 b=aZzN07VI/5IBbQXF0tf+9MP0iMiwHSb8W9Nt9vnmtmpFg90FkQqXsfTEEK2tVRnJ1d
 TVIalN6Kyw6dxBEdbxbSq4dJorHN3PBv8NgwvmYbyyXyeaI+dVqdLds6oZjrIahaRKox
 7mW6lw9vsSmhdXKGB+GARMVdXw+Tq+Y+pfVBRT2SjoF0YDYUrQsBFfzqKZJDcIFYXswl
 RswCM65UksLhILth8fXARKwqPeScv9ltv+V0lNZCiptNk/XCDXbXroSQfdTGK8pX+ulq
 ty4wzzxvNFk+oSn2hp3TmY7sSWrH2WzCxe1F5i7MPvaGdixBFgW8VcW8BZRTZDSLTtnd
 DT8A==
X-Gm-Message-State: AOAM531Y4kgLhIAfwmqsPaXKGGc3kS+YlpQHsSls/fR50Wa2I2wOcBPC
 E58m1sSfwhyepDf8tL4tMbsCl4Hc1d/lGE3lvVB0NtBlNECb/qsjnJ5qrIsvXVitWjPfbwFdL1q
 VRFyquxJM5Hrn1GrP/xwfBNVhIkc=
X-Received: by 2002:a25:ae47:: with SMTP id g7mr470310ybe.110.1603334190416;
 Wed, 21 Oct 2020 19:36:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe3PwtAVwp/oqKR59uQ8YMHRTBRBTzBhZWICukfsBjx9fWuCl7g0yLfRIyL4pmnEa8Kbdik+AxBh670Tnjk/c=
X-Received: by 2002:a25:ae47:: with SMTP id g7mr470279ybe.110.1603334189926;
 Wed, 21 Oct 2020 19:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201021193547.GA49488@x230>
In-Reply-To: <20201021193547.GA49488@x230>
From: Li Wang <liwang@redhat.com>
Date: Thu, 22 Oct 2020 10:36:16 +0800
Message-ID: <CAEemH2cAeMzbr6WWDOTTNYkU8b+1J+7WEHjGU283r3qWtXP8TA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Broken Fedora build
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

Petr Vorel <pvorel@suse.cz> wrote:

> Fedora build is broken due missing <sys/timeb.h> [1].
> Quick fix would probably be to use Fedora 33 instead of Rawhide. [2]
> But we should port hugetlb.c and trace_sched.c (if used) to gettimeofday or
> clock_gettime. [3]

+1
I prefer to go replace ftime() by gettimeofday() or clock_gettime()
way to solve this from root.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
