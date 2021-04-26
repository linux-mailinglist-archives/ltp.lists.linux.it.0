Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF6136B3D7
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 15:11:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AF753C6759
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 15:11:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 64F1F3C2197
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 15:11:26 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DB3921A008A9
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 15:11:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619442683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T/en82bptCVAj58igmITO8j9ZEPN/RysRRDLfAZ6JK8=;
 b=YYXl2qpgq6bzcko13q4rbrfuvgbg+OXSR9DcHXtDiLvjl57fuZm/gWYCqVSmYIghvYIbyn
 cxLu8Bxnl73O40YVMuZC3udnDvRIMfjOBM9DpngJC8kRHuYQBJz0n6YvKxe89NdftT6R14
 JmblEz5Ye48Z22rpnhPkommrxQUc0LU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-0BOLrL8gNu6uoyNAPNpJqg-1; Mon, 26 Apr 2021 09:11:19 -0400
X-MC-Unique: 0BOLrL8gNu6uoyNAPNpJqg-1
Received: by mail-yb1-f197.google.com with SMTP id
 s2-20020a5b07420000b02904eb842efc40so33423751ybq.3
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 06:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/en82bptCVAj58igmITO8j9ZEPN/RysRRDLfAZ6JK8=;
 b=MA230CkFS2ilCDeOtsrKGnJ3L+hbAyl0hzcyCEztAzrNFD3dZ0tGzxbp5Wf+Wc8vbE
 7ye2yiaJfdIR4Js7aLFLU3eKfVJFAfpLdUBBsrKZzJfgktVKYuXdG/f5lFG55qXJjWOm
 /u0j+pmQSEMPNJaDVOWCWMGbANmPBIEVT+kGEHiWvkzdSCYfJljIYi74mS8Qx9K8ZvVW
 gGxInIYEVOD8ObJuJwJHoII3uvHFw8XDwrmVyRFnhfIjGBEm8KpzeA+/5wlo+dbJy9A0
 HzPfYRME1jEVloLfc/DLSUBw2/Ll+9NUEDWyPqhMWfIi2gTg9SyquaFV+LjNJO1jkInu
 /2UA==
X-Gm-Message-State: AOAM530cLj62D/P3dw+TmiUcVVs6HyMwfrJ2ObGyGMguDHaDKC613Ii+
 uPaSuOG0lpaUmsrxhrwfTMm1j1hkgmB5sYJbnRpNXbwPjuAl+JVskrnXd99v4Ww7T2RbpqyXbKx
 8EREGfnGChM/IKun1tC02rIVo7UY=
X-Received: by 2002:a5b:787:: with SMTP id b7mr25681245ybq.243.1619442678497; 
 Mon, 26 Apr 2021 06:11:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFI6FJ8QIR0ob4sOhueAnfZbAl7YmO4ELVq1w4Nh5yK0eCsTxs8Bteb/5W3a3Mbmjpsqx41h1j1Yv5a3Or57E=
X-Received: by 2002:a5b:787:: with SMTP id b7mr25681215ybq.243.1619442678248; 
 Mon, 26 Apr 2021 06:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <f224defc029816a74c518c54af2fbf2b90a90da6.1619176445.git.jstancek@redhat.com>
In-Reply-To: <f224defc029816a74c518c54af2fbf2b90a90da6.1619176445.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 26 Apr 2021 21:11:06 +0800
Message-ID: <CAEemH2eieMfag5MDeayoeFTjn+JBuKKk8JB-bLVn6uY_SxUWhg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkfs: relax size check
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

On Fri, Apr 23, 2021 at 7:16 PM Jan Stancek <jstancek@redhat.com> wrote:
>
> Number of total data blocks in filesystem reported by statfs
> may be less than current formula of 90%. For example ext4 will
> subtract "s_first_data_block plus internal journal blocks".
>
> With recent change to e2fsprogs, overhead calculated in user-space
> increased slightly and LTP test started failing:
>   https://github.com/tytso/e2fsprogs/commit/59037c5357d39c6d0f14a0aff70e67dc13eafc84
>
> Since there's no strict rule how much the overhead will be,
> as rule of thumb relax the condition to 80%.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>

Reviewed-by: Li Wang <liwang@redhat.com>


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
