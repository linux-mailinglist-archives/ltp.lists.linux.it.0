Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA39A8B7
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 09:25:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC8803C1D5D
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 09:25:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id ADADD3C1770
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 09:25:11 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C52F46010DD
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 09:25:13 +0200 (CEST)
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A35D085536
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 07:25:09 +0000 (UTC)
Received: by mail-vk1-f199.google.com with SMTP id x130so3368482vkc.19
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 00:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HgmyPMN/HyIKU6+Qanf8J4EXmFa7kqI1IvXIVkSCP8k=;
 b=feZppGOjb+hnr+jXxi2hMsWuHCQQ0MweTqy5Ony+7aHiXvnp2NQzER21JdyFaLNNpw
 qu88XU5OmhjI3Og3s3Tnhco9m4XZPh/kP7W39d6Xl1maaAIKCC3+P8acxtNBRyhag/+1
 fmsXwH7PUl+TOiY1o2I59VOg4hYaYCxNVOXwxIhRShrEkXFwJcHDdoXH18+3jalQunSK
 WeQdAIjUJZBKPdGWQJs5ZnZ6ATMxFp7tg5WeZ0XYo2O/ChGR8GHm/PwVkzj/ZyZLJjmc
 mr5qYSyQEQKpYCitm5ljXMivehFifYsieCPc+jXeNbqsbfIq3EZ+39FP1sWNaBUegrTR
 XYNA==
X-Gm-Message-State: APjAAAXntUz+gnx0fjLXqwFanU/9TywezojeBXgTkboLtwHMMh/7UVU5
 YrnRGe8xNtykqQK09XYaPza1y5I8mD8NMxqmkBeo323KZKtHmeJvyx6vzb61W3kF3Sh7oNmTlyK
 oPlKdITNCue47pU8xkbnDOGeux7w=
X-Received: by 2002:a1f:3f0e:: with SMTP id m14mr1711818vka.91.1566545108878; 
 Fri, 23 Aug 2019 00:25:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziH2q2ibst0m4N6UFFOKFtAgaZp/AZ+UrCk9TW6ZVlbcqhfieCKvtYcoN59FYXKC+Q/y9UU7o6jaD9YLu9I1Q=
X-Received: by 2002:a1f:3f0e:: with SMTP id m14mr1711810vka.91.1566545108598; 
 Fri, 23 Aug 2019 00:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <1566541374-2225-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2fT1_ATcKB5bD9OvsnJP1vsRbib_MGyB1Bk_U=Ccd1VVg@mail.gmail.com>
 <5D5F922B.1050506@cn.fujitsu.com>
In-Reply-To: <5D5F922B.1050506@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 23 Aug 2019 15:24:57 +0800
Message-ID: <CAEemH2eq2qf4ZfejymWVxAgxZrf6qBsyggW_gzkBPSCuYRzmfg@mail.gmail.com>
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

> Petr' patch looks ok but I don't know why it isn't merged on master branch.

Sorry for the delay, I have just merged that one.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
