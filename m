Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJvGGLgVoGlifgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 10:43:20 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F15FC1A3A2D
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 10:43:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772098999; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=E9ke/9+B1nY8x7flvRHn9gQPIhmew84UGh7BiXY4Q0s=;
 b=I9/xhxY1lLVcwfwqxpBTYyAo2ecFDblxlsk/r7WFJTSeaNz7NgDYgEYxgqoQYQgbIsA1P
 GVVDVz6iNfp/SFgDa75KzIQoZEKnPcizAcWbuSQiRMNvXi8J4ymKLvCm9t9d2CARQBmsLjO
 n+vwzEzCb2VA6OzImrejBKMS5frj+Vo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 986F63CB5C4
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 10:43:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 73DA93C536F
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 10:43:15 +0100 (CET)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F0CD8600847
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 10:43:14 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4833115090dso6872015e9.3
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772098994; x=1772703794; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYuBl8uCos82Mls2fbGKErKTetABxXmaIO4ehY+KUM8=;
 b=eKcrU118NbqX2zE7xnaMZ9CBEIqn5DmNbSm6zL2eK6mKYqWHKAXn7R4wlD1iaW2NDE
 Nuv7WyLPC7yANDxNIM8OXkXDbDCQyneAK+PZG+aJjXgWHI1+vrG0Xpj2ffME5DSQpMuR
 aKMiYukN/16d9Bxl4AMXpyx6cWf6U26OA7e8cDNbzNRbGJiDbudvIV0gJHtwh4WWLtwa
 gST61s8Kx0tFTNzZNtLqFteV1LP3dLtuo5vTXrRvxgSZO6TJaTnYaqh6kFGUmV5PhNhi
 YZpYJAxjYOhR4vCysQ0c/mRjs63e08WLVWRqCQag04rmYJkkxkEl7uMQLtob8L1Fz0/v
 RoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772098994; x=1772703794;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xYuBl8uCos82Mls2fbGKErKTetABxXmaIO4ehY+KUM8=;
 b=o4DvQipas/6K8P4xp2mVHauLmZfo6xgidz5uolCJfVG8GmEqgXVpBuprGw3W07x0Pm
 1Pv484omRjFQNOIOhFa2GKo4PYNKqDAtoRMnRY9gamaAaKPYPg6WNkXFXHDz1SG5CGwq
 asAbBm1aK/ZU9+MgYEl/YYVtg9yG+PTnnpkdn86B+yRmZspT4sxSGCV351BeZiNxtN7W
 wpTX2TZiC/PsiQTsG7qdoJIOWYRtWQOC+IA6hRbzEQZEFHOkgVoiwsdP+N7INFxjnFKS
 IbiKURZ5F5UZXbG+CLKjEYOqU9qsDBFb4ePpAEXHINhz4H/iUs2bBjt9O7yMD+wFIQEW
 jGIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7F/Xy68+jd8bp03Isfm8Ixegq4YPBsuoFahi7yzD8XjLJAXKl36pC2sjPHSVWFoqviGc=@lists.linux.it
X-Gm-Message-State: AOJu0YyfS9+P8vMAUkNaGrlFW0aAUL6iXDVUbw9Efe+xuD5JqAiKHLnl
 Gj3wZUqHlTXdAPymYOZXzLKiVUguSiU9NCgon4hrlIjmLG5VqPUXE6B5ebrKMz6S3MU=
X-Gm-Gg: ATEYQzzRN1Vj8QeGGTnqdIAGoPmrJufp5Dq1VYp82JsuSeMRP4Diyb3uDS/ZolS1Fuq
 +e1J3kX5R8ZuatMSBn4eboRdDbH9s3BM22BbJLnaeGnEvxqAmu24EUIZT0el3G62uvtO4zQFXCV
 NvmhGbF5TuhpfgjiUyGaCzB2eOl78AjC2PvWBsateW8cAMd4gOAi0Rfr/j2bDUaOfBK/2ISYBG+
 LO8rFgj2LbteRDDehmAeXCemQxKVUl7eWj3sEGrj11ScxBWbmk624UKpgWH11ReGpsYDZDhnRF8
 rXOXyXetVML4ZvgPuh5c/dJ72El/VOzK7tX/dC09banUcGW2iHrk3f0uGrIBHlpFOdt4xkzC3m2
 mTiPqyrwtcf/56S9iA6l7LVnZN1vf+ahUkJPy1fOXEw1z884Y4MrnzllmA6T8Xk/ULEcmmbijty
 PzdvNveH34hHu9d1BD4qILKJtessW8ofrKAFjx+wVK/uc0RJqLg/lJHJt7fUFulAzy/PtsFufv9
 bgk5xOHD7CwyZUr3o8+yvzocI//UQ==
X-Received: by 2002:a05:600c:1d1a:b0:483:361b:deff with SMTP id
 5b1f17b1804b1-483c3dc4db1mr23418355e9.14.1772098994313; 
 Thu, 26 Feb 2026 01:43:14 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm206683095e9.0.2026.02.26.01.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 01:43:13 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 26 Feb 2026 10:43:12 +0100
Message-Id: <DGOSNYJLFNWY.26YQZO5T79P3O@suse.com>
To: "John Stultz" <jstultz@google.com>
X-Mailer: aerc 0.18.2
References: <20260224104544.101292-1-japo@linux.ibm.com>
 <CANDhNCrrZY=5bvRQGGJsigjwRNmDz8shbtM-Vtn5UkdRDGU_uA@mail.gmail.com>
 <DGNXMJ74NVTB.2DY53W36K3GET@suse.com>
 <CANDhNCqASmDD99T_viiAnRz55otuNWAzvx-JL8Td8Q_=Qjwgyg@mail.gmail.com>
In-Reply-To: <CANDhNCqASmDD99T_viiAnRz55otuNWAzvx-JL8Td8Q_=Qjwgyg@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1 1/1] sched_football: harden kickoff
 synchronization on high-CPU systems
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: Linux Test Project <ltp@lists.linux.it>,
 Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url]
X-Rspamd-Queue-Id: F15FC1A3A2D
X-Rspamd-Action: no action

Hi John,

> That seems reasonable, as long as it's clearly labeled as a workaround
> and hopefully can be dropped (or kernel version limited) when the
> issue is finally addressed.

Sure, that can be eventually addressed by using `tst_kvercmp()` or
`tst_kvercmp2` (to be even more specific).

Kind regards,
-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
