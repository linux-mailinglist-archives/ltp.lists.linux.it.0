Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBDB387399
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 09:54:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4995F3C6079
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 09:54:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C5B6D3C6013
 for <ltp@lists.linux.it>; Tue, 18 May 2021 09:54:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 233651400F39
 for <ltp@lists.linux.it>; Tue, 18 May 2021 09:54:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621324477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VyW72Xojt/gPoEESC9ia7fTryPIVJ+GHl78ZjDXb6T0=;
 b=glzcEFT2ut6Ed333NwMES1OsYBW6cdpE+YqdhxBGKLRD5o/TUaKExIIFW/PVBghujT4J3k
 rfQ+uhtb0MNlFuzgW17Ux7Fat0ZOGFY16+JZ3rD+g0o9FdU4giSAF9Uu3dFTUEPBaWfdni
 Jno7r0lgwM8XgCmywSBQvWSC3/cD9PM=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-U9VAu5cCP8qkKU2HY1AKVA-1; Tue, 18 May 2021 03:54:33 -0400
X-MC-Unique: U9VAu5cCP8qkKU2HY1AKVA-1
Received: by mail-yb1-f197.google.com with SMTP id
 p138-20020a2542900000b029051304a381d9so357089yba.20
 for <ltp@lists.linux.it>; Tue, 18 May 2021 00:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VyW72Xojt/gPoEESC9ia7fTryPIVJ+GHl78ZjDXb6T0=;
 b=AKG9nIzRNiqhzstDOAVTtIUyQS7+kKkcd5fDBIIB+vxQnSnxtNATDxBKQ1jUlUWanq
 4XTidC4S1kuZ1gFJU4Qo8SbO6hAzsvjD7KmPMvpIY+t6quWabxlcxrcsTR/gs+C0TYHg
 KRmPSNg1dBk8SvgYNMGG2/ANChYnOB4RTRCjpFIrkc5/MaJsqm6yxHGSnacCankLDPf/
 A6MG5doTY7pg8gxtvZcxiUl+LLbyoJi2LXebuPAqeCLyvrcwJcSfFPrkI/DIPhk00Ka+
 mxIflXS4vQIa4ICKxyCa/HBuJTT+f8Pwura74/mSyspJmwGe41rppAzwcPknrVSaC5+x
 zYuw==
X-Gm-Message-State: AOAM532xOYMMH0td/m0nub3Q7dIIXrDHnXeX/0yCRb5VNzD78s7d1hMU
 /HQbRVb50XEk/Hz55FD2RajD8fFV6JQ/+iAHT7QXbMJOOUxaYd2tyXimXM62qR7z0b7hTZ6HOoT
 4qxxmgw9Ni5ZDbol1r9T+WDMgu2M=
X-Received: by 2002:a25:1189:: with SMTP id 131mr5788592ybr.286.1621324472833; 
 Tue, 18 May 2021 00:54:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaojxPCR9oU02oNURDl4R37vZZ2JGIbaVi30dTUvK1nVJ34v80+kM7X6h0VdRE/lysJ0Ody1lfslSyEG5YWMU=
X-Received: by 2002:a25:1189:: with SMTP id 131mr5788575ybr.286.1621324472666; 
 Tue, 18 May 2021 00:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <YJOYgZNL7/qp5YCN@yuki> <YJpq26w8NBvBzUSc@yuki>
 <YJz4A3mR3jHciihe@yuki>
In-Reply-To: <YJz4A3mR3jHciihe@yuki>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 May 2021 15:54:20 +0800
Message-ID: <CAEemH2eo7LOvz0LBwuaNkM2aRRWxD_rErOWFyHjVOpRB3oNCsw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] LTP pre-release git freeze and call for testing
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
Cc: automated-testing@yoctoproject.org, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> As previously planned LTP git is now frozen for anything but imporatnt
> fixes and the (ideally) week of pre-release testing starts now.
>
> If you haven't tested latest LTP git please do so now.

FYI:

Tested the latest LTP branch on RHEL8 (with itself kernel-4.18~ and
mainline kernel-v5.13-rc1), the result looks pretty good to me.

Mainline kernel:
  mkswap01 6 TBROK: "check_for_file /dev/disk/by-label/ltp_testswap" timed out
    - looks like hit the race condition issue as before
  hugemmap05.c:84: TBROK: mmap((nil),2147483648,3,1,3,0) failed: ENOMEM (12)
    - seems caused by memory fragmentation, not a big deal

RHEL8:
  mkswap01: same as above
  bpf_prog05: known unfix bug
  semctl09: known glibc bug
  fanotify09/10: known unfix bug


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
