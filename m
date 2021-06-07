Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9726139D80E
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:58:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E79393C4DBF
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:58:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9FF623C2698
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:58:10 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9D9601000A38
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:58:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623056288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oq0uQJ6w7rloFJHY+8RH2NSVH5vTlWUQYDk3n9s40X8=;
 b=fa436x9PmyOwfuHRkiRaNOuRAEHvkclW4kai5wRvEj4LXoJSuotFMhij/jEjIVtjVweRsg
 Kf6Rq6eQX+Qm6S92n4mJpEFYSchsIudtC+FvnQtO/zv4URSrgMVSo0R2yF3ok+3wqBiE7d
 2f1VOlIqYBL4pi9XMZN005VFZVPhuWU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-qfDvuMT0OyeEH-6Z5rfccA-1; Mon, 07 Jun 2021 04:58:07 -0400
X-MC-Unique: qfDvuMT0OyeEH-6Z5rfccA-1
Received: by mail-yb1-f200.google.com with SMTP id
 67-20020a2514460000b029053a9edba2a6so21536569ybu.7
 for <ltp@lists.linux.it>; Mon, 07 Jun 2021 01:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oq0uQJ6w7rloFJHY+8RH2NSVH5vTlWUQYDk3n9s40X8=;
 b=rHaJMlLlYrSEk+DZp2B3vOLzE1A30BXfq1Xjry3kLndhEaw68NrWXI0XUxjpoeZnjz
 1YYwLspUT1BWSrOaq9peL85qkUALXucM0a3m4tDLpaa+76IVAhedFerKGiQvQVTiFuYj
 YZVPpA59iiV5PRWN+r1IQ8iP+g2nht9wiaGj1EPpiatq7syp7aYcWaLEWZyQLpGNRZqY
 hRLP+s/Hnr6Iznp+XtefqXDa9qlrCVpMJoWz4o72SI2sMXyWPLHoj/gDDIfl1D0sMRRI
 E9b0ThxJiCIw8kYexQ94S3j3rlJZYSQ74EWi5dvJYQXZMiBuy61X8peKbaN88bY0uHWb
 gmFA==
X-Gm-Message-State: AOAM5338oSbOh0aNrzEGZdCWr29VfIyg6FPow5+BmX4TRJLdWLwJq3BD
 erCA06bcoXOkcblRN5eoXyBiwbXjl2Ib86w9mkwqmQyjvdwqozO4LGtRwlztWeRcZjDFj7EXoVI
 /3lxF0ycPiyZvqjV/xJ0E3OLPXAw=
X-Received: by 2002:a25:d412:: with SMTP id m18mr21410415ybf.110.1623056285910; 
 Mon, 07 Jun 2021 01:58:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqmEYFCRk0ESXJmOSy2Yu8XRxqdi+oycPZhNDPYcmyKS+OwlsPE+z+VhOzsjcWlvPD4BfuZ23CrOeDPVmNXUs=
X-Received: by 2002:a25:d412:: with SMTP id m18mr21410289ybf.110.1623056284284; 
 Mon, 07 Jun 2021 01:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210607074234.5382-1-xieziyao@huawei.com>
In-Reply-To: <20210607074234.5382-1-xieziyao@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 7 Jun 2021 16:57:52 +0800
Message-ID: <CAEemH2eo7YWpzxz22uYn0dz-qQwZvU2g+D8zsCJCVRgtTDwAGg@mail.gmail.com>
To: Xie Ziyao <xieziyao@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/fchown: Convert fchown05 to the new
 API
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

Xie Ziyao <xieziyao@huawei.com> wrote:

> 1. Cleanup and convert fchown05 to the new API.
> 2. Remove {NULL, 0, 0} and add {"no change", -1, -1}.

Patch applied, thanks!

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
