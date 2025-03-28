Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A1A748E9
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Mar 2025 12:04:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743159867; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=w9oL8KjnAXrM7FHqagu4kyLvmzP1FqMLXERRQj7IOoI=;
 b=BAT/y7+kt6HNt2pKaUVQeTcBv51uxA1U4DhFTs9jMNUuJORsapI9n0zOImfY6CVIcWgX+
 gRSVOJehzs8HI5pl0xCgVsgC9QfX/oPRLhTFI2GCPTXYJWQfQwJyyG6NjYkwsfh4Z5HaxRB
 JVXrT97bTz8vmMAvjn7+ju7V+CA7mRE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F9E83CA2DD
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Mar 2025 12:04:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 57C603CA27C
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 12:04:24 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwan@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B4FC410006D3
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 12:04:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743159862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UmL2SL6gkh3779aAr6pSUEbe9aNXhAY84M127ypuDo8=;
 b=NBQNxV3hsBC/n5Yp0N2tl3NMEGaQuCBDYi3TXAXIVdO+2HyRp5P2mZv27oeDeaaEfjaBAq
 mNLNzpvAp3daatF3UvW+giYGe5lvnEaMP+fzhSQwlz1uhwurci8uNz38jA6/LrOcBdCfHS
 /wnIsybx9RQorsEIhHSHMgVFC614G8g=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-Fwo1sfU_Np6B8DSfuvyb5A-1; Fri, 28 Mar 2025 07:04:20 -0400
X-MC-Unique: Fwo1sfU_Np6B8DSfuvyb5A-1
X-Mimecast-MFC-AGG-ID: Fwo1sfU_Np6B8DSfuvyb5A_1743159860
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2ff4b130bb2so3821621a91.0
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 04:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743159857; x=1743764657;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UmL2SL6gkh3779aAr6pSUEbe9aNXhAY84M127ypuDo8=;
 b=pjLxnjaBiobYEtbdr44M7JuVYCL03/4BL2lgNjttZvOrOWDgIVI8A1IxlczOr10fwF
 anLXyVQ1IP0e9UTVZrV3z9+K9RUZ8Y70lo1WslZ3uvh0U9c9UOvCYPEiSQ925hbIl1mU
 exyKyG2SDUGEWvgRmHu6ttnlmD0Khqk+d+ILFDtrgehgFLkdI8k6GiuKTWFk/uRT4IrD
 YfelDqxQTE27qfuGEaoHHmHuv5Aso5f4dB/uM0fvcTxm+Mfm0rpL6nME34e84JyynnyQ
 EbhEKzb2bYRTxE0tJSXjF2UBSwPkr5ch2IMXjwwOHaFgoi6+JwXIgx/a6e5uHIXIdp0Z
 VlSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKzfcSub3mOxKTtXiKPB1fE5OR6F5ouysf7sMgpzgT6hliW5Arc5oBoMJguKY603M54i4=@lists.linux.it
X-Gm-Message-State: AOJu0YyQy0EzKWoXVRabAt3KYjKaoUtWvBJiel4vz+l9x6qKfAKOl/Vd
 0yMBIuuHcr1Q2IISAsuB+KF8wBLOr/9qWnmeDUnHr+GUKWU6PcIlY007OSVl9JOMvzp0cMdTu1m
 RBVYHdODhO4m/6A9kEWNXr144S0vZwvgWvYhmm/AVoJ7CbnJsLv2zoDJAQSEju1EzeZSum9y2Gf
 Ik7hyTJqhmC3qjm2OZRbiOmZMFfvR3yH9iRPjD
X-Gm-Gg: ASbGncsAXBQ9/gJg0cpeMohERBysJYVAfNgXqamIPqbMzlBVEE+uaJGZkQ+KAJGXUjI
 c9Z3WqFI7CX+WQa1uySEtJ7iySUFI3OyzaiWi+hyyL11WZ6wglNz2c9RlhJPqE1vprVz7YzR2BQ
 ==
X-Received: by 2002:a17:90b:198b:b0:305:2d27:7ba0 with SMTP id
 98e67ed59e1d1-3052d279ab8mr234193a91.6.1743159857041; 
 Fri, 28 Mar 2025 04:04:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7jwAtKfRyjJAkppiVsYk8DlqTi9dTakBfVFRwL7/TozT0PjzckICa7Mb13doGUs/yCeBFBUXZPvnKnjb8qak=
X-Received: by 2002:a17:90b:198b:b0:305:2d27:7ba0 with SMTP id
 98e67ed59e1d1-3052d279ab8mr234162a91.6.1743159856603; Fri, 28 Mar 2025
 04:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250324120049.29270-1-wegao@suse.com>
 <20250328075958.7616-1-wegao@suse.com>
 <20250328075958.7616-2-wegao@suse.com>
 <CAEemH2fYLZ9=jS190QXiYOza=1=hvVvpHu-8mWOYG7QKEcqgcA@mail.gmail.com>
 <20250328102008.GA170353@pevik>
 <CAEemH2f9==38Dq=6QBuYwsuw3yF=hogWksE5qX1bPUb4ysfOUg@mail.gmail.com>
In-Reply-To: <CAEemH2f9==38Dq=6QBuYwsuw3yF=hogWksE5qX1bPUb4ysfOUg@mail.gmail.com>
Date: Fri, 28 Mar 2025 19:04:03 +0800
X-Gm-Features: AQ5f1JqVL3boTEfWYd7FHNStP8hj-_rwCF6y0Ja3kF9YpJHGI82y_0jKIa_xVOw
Message-ID: <CAEemH2e3x6hJnvEbAFk2vGMK1eLUTN3QYCoA4e3_bWfTFVFVZQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UAdn_AqtpiwfLPn80edcdMuo_ULeY-MaDTLdMIF8VqI_1743159860
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v8 1/2] cpuset02: Convert the test6 from
 cpuset_memory_testset.sh to C code
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Li Wang <liwang@redhat.com> wrote:


> Ok, I see, it was used to disable the task from moving between CPUs
> in the cpuset. But to be honest, that's _not_ necessary, because whatever
> the task is bound to which CPU of the cpuset, it all belongs to that
> specified
> node by limited Cgroup.
>

One more word, this only applies to test6 (in cpuset_memory_testset.sh),
as it only makes use of one cpuset :).

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
