Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50542387513
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 11:27:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22D983C87D7
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 11:27:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BDA473C1B0E
 for <ltp@lists.linux.it>; Tue, 18 May 2021 11:27:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 33778200C70
 for <ltp@lists.linux.it>; Tue, 18 May 2021 11:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E7z5MBKJyAdl0jArt2kWe3PT7rlFbNpdIhyaQNB8vqI=;
 b=V4bHMOdgj+0LGXnfppCpWVbiAqevm7uY0iDstoa6Yf0P/4X0FgWyDTqxb0qJkgtkQTdy8a
 VBT97GXx5EhR/0BT4KPjGmZIKh+xhy+mW5gRjU8nDiMl4nJdWGaIbvljcwTpQMsk9ko+jy
 J6WcBghbi5DZA2npfnxoA9LPRLYRstk=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-g9o5dhxzOrKS_ncQK6JPig-1; Tue, 18 May 2021 05:27:35 -0400
X-MC-Unique: g9o5dhxzOrKS_ncQK6JPig-1
Received: by mail-yb1-f198.google.com with SMTP id
 j4-20020a2523040000b029050d0d623dccso7899404ybj.15
 for <ltp@lists.linux.it>; Tue, 18 May 2021 02:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7z5MBKJyAdl0jArt2kWe3PT7rlFbNpdIhyaQNB8vqI=;
 b=Fc3XyIvltBrVbImHqd3PH5me7ps2yZxXYtvR1tRT1c3WJhmtwpglhe2kYKW3B2QGoM
 KdXYv7c3gzxEWVRUVJdXcpBXsHXkxDQ2jREPP2nQlxJMcCKjF9oDnC2ZhBoo22YFnWUv
 lpMJR7RET9ALdYY4Y5IT5rT8f1ianwnYPfc7xenSCo/2wWp3e2cc+d8HyC6/NuGEtG4y
 vOK33cBx7HV7gAFciAs0Eq9xRgeHDLs5KE8go0OoVc7d8rXvOqKXrm5GD6yX0TUvr89a
 tvhhYUuwpgLgWlNstjt/DHSzdSJ/baw76NltgaByRqwV0qf46ieC4T0sKpIlrzpYA2B0
 iuPg==
X-Gm-Message-State: AOAM531SUKAS2ju1eOLGKEJgpTJwU85PsClXrXvRN58adxX5KydPLvgH
 ryIjBa3SO5l7ViyDDRIwqB5rX7fJbrrKZc5+4Su83U+Vcx/heNPhuIuasALLX9VDSMJjyYTuz/V
 Uh+gvcoKJZJd+NRYCBE5ZMo9LmRQ=
X-Received: by 2002:a25:d8d6:: with SMTP id p205mr6464255ybg.252.1621330055345; 
 Tue, 18 May 2021 02:27:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnhfm7YYNqHURzxPVYnO9JeQXDGQ3rhLLBB+m/MNihNOkxtAafOe8BkYxHjVSXks2cDa9a7fNFcrKTM/tGDk0=
X-Received: by 2002:a25:d8d6:: with SMTP id p205mr6464231ybg.252.1621330055098; 
 Tue, 18 May 2021 02:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064506.203781-1-xieziyao@huawei.com>
In-Reply-To: <20210518064506.203781-1-xieziyao@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 May 2021 17:27:22 +0800
Message-ID: <CAEemH2en6C3dUzspuVwNVmRiUeBQWK38bLPT7+ZwErVFQG+i-w@mail.gmail.com>
To: Xie Ziyao <xieziyao@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] typo: Add necessary spaces in the outputs
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

On Tue, May 18, 2021 at 2:45 PM Xie Ziyao <xieziyao@huawei.com> wrote:
>
> Add necessary spaces in the outputs.
>
> Signed-off-by: Xie Ziyao <xieziyao@huawei.com>

Reviewed-by: Li Wang <liwang@redhat.com>


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
