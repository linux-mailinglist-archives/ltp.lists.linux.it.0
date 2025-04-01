Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F37DA77840
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Apr 2025 11:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743501546; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=PKxnKMinVxkFBUiN3KeaskJ2QId5qOmLVyUdN6UaPc4=;
 b=qC/sX+I3Qi8YI3AuIW6Xatj5x9fNuP3gl3j2+b60IbZXckdOnlbeQpVIJYOy0Wakdvpic
 fvjjPFRDCT/ZAPJlgzFF4qtFc49vE316xkIS8s5aBbAcYnfm/0C7QcqwhjpplUrVuJrkdMp
 IAI1v4lyhLzRD/iy9kBWqvQCtYpm3vg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 642063CAF80
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Apr 2025 11:59:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A1DDA3CAECA
 for <ltp@lists.linux.it>; Tue,  1 Apr 2025 11:58:53 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwan@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EB6B9200978
 for <ltp@lists.linux.it>; Tue,  1 Apr 2025 11:58:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743501529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YnGh+zO25i/4IaIq7hKVl/vpVbcqtjkXPT2QFIdzcC8=;
 b=E53osU3q75SE6HuIcjVGIRC2HtFfFgWm0iVYLc5tpUIH4IoAeOQ7RhUJnXQMk3kaGMUJCW
 LO2st4KkJ1MlsUQ0y8NVBO6qFI+aF11+cP+H9wdGt1qXhvVc10BJtjdrqvM37wy4Dgh2Jr
 sI+b12c+6TZVCOa68rSLgqKHNLFLygI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-T-IsGMxvNp68T9Wd4xunJw-1; Tue, 01 Apr 2025 05:58:48 -0400
X-MC-Unique: T-IsGMxvNp68T9Wd4xunJw-1
X-Mimecast-MFC-AGG-ID: T-IsGMxvNp68T9Wd4xunJw_1743501527
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3011bee1751so9158812a91.1
 for <ltp@lists.linux.it>; Tue, 01 Apr 2025 02:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743501527; x=1744106327;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YnGh+zO25i/4IaIq7hKVl/vpVbcqtjkXPT2QFIdzcC8=;
 b=CtAr0otAp6PXUjTcwcnyaeDfRftCEog8CzXGZZX4Tk+2btKtk327LyvL2qspSPt/um
 uQw1UPfazQtLY3itlk8tp+byZpKR0fWpuu4AUboejFfk2MvQz1DKd52UkYwlzK0Uj9+e
 lnHtVYFhPiHkQOHpniFfxsM50es70hNI7iEMIOAnYyh5WTqyMKnv9vOlxbYWfmwhdXhn
 oMlg31n945BGeVJAm+enxS8xWKTrDRiP7ENFuC4Bcwu+4tkShQTQef3JWJStEm8GAEHq
 cyj99ql3rEfpkp8Z6k7BqiKCJzAzR5kE0Ucvn1rhgtG4HPq1onas6r6SAPQevwYb9FZG
 hClQ==
X-Gm-Message-State: AOJu0Yz/KAtcezI395oCQ9eqjfSSUrk3r3j+6ePxKr/pxV2CWGOFVa1X
 US++M0U+Umaz6XbSOk68OHw0J9RnG5WbV9HlzxvHhSkzEoDItjG21SysY3MZmWKWrQmNUGlYkvE
 DzqISoZW69oH6EVu6lWS9nsrkcz7pclrJKtq+jBquHlakRXDvEw36T0xV2nH2cRr4WveSIgE1qN
 b1x6lc2frGmypy8rGNa/i7LNg=
X-Gm-Gg: ASbGnctN2dqpanjNCIDOR70euMXuJv4TaoeoeWmnWZRBqDCS0Sn5k9HvYt0Kt/abkkI
 fNXjFV60GoBliKVsimgCpyTdXn9jv7lJ3s0ARfBgJbdwdich482DFkbrXta3dOdcJZZ9fA0OYzw
 ==
X-Received: by 2002:a17:90b:1e11:b0:2f7:4cce:ae37 with SMTP id
 98e67ed59e1d1-305320b0883mr18843552a91.18.1743501527166; 
 Tue, 01 Apr 2025 02:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDShigyYsPd7Om70oA/1FBZ3Dc+liMY06FAhmH5u9Ji4XB8B499bTZyE4DF+B/cYci2LLBqUxPnuz3zvTFS+M=
X-Received: by 2002:a17:90b:1e11:b0:2f7:4cce:ae37 with SMTP id
 98e67ed59e1d1-305320b0883mr18843529a91.18.1743501526848; Tue, 01 Apr 2025
 02:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250331031945.5948-1-wegao@suse.com>
 <20250331132537.26417-1-wegao@suse.com>
 <20250331132537.26417-2-wegao@suse.com>
In-Reply-To: <20250331132537.26417-2-wegao@suse.com>
Date: Tue, 1 Apr 2025 17:58:33 +0800
X-Gm-Features: AQ5f1Jqr6SXMxQmBtmzSca0Cz2dc9-wsxmVJ48OC3peV1fuMdlgMnf0QuhzgQGc
Message-ID: <CAEemH2e4=oxgk_-i4TN6D7XoXjEg3f+XigLwTOHoezPXwuvoJA@mail.gmail.com>
To: Wei Gao <wegao@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xdmwXOzffuls1_90kJ8Ca4rI1J1IBQn3TM_lXAFPoCs_1743501527
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v10 1/2] cpuset02: Convert the test6 from
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

Pushed with minor improvements.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
