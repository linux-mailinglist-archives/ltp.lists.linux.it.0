Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FniG4G4nWnERQQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 15:41:05 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E03188818
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 15:41:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771944064; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=Wfk4xEpsZVROzV0N0e3SuChL9KlOeX3vk3tHsiIT3B4=;
 b=l/aRmbOQKcXlRf35nk+gb9MjYFMT0qFVZDql5EYHABhmQ5oJlRAT0CsoA6D5//Nt0kv9C
 h1bIbRPu46CDjTfbRO7J7vwWXxjJadYul8jALah1sAMCYXRobbv8znaqrea3jVpe2yEYZMg
 2hDFeuODYRtPQThpnDojw3uXJdLaAYc=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C1123E8B83
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 15:41:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BA5ED3E10D6
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 15:41:02 +0100 (CET)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3BFE3200910
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 15:41:02 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so34143755e9.0
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 06:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771944061; x=1772548861; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWYXEUEifFZBMHeVmrbJAPnEJvyyfnEVusXUsSRAp9o=;
 b=XC24jKhDOVrWwz4ylN1kJpy2etO8bvW61IAKJrYTa+/ZoobkabeH0VA8ONa8vjvJ2R
 DgkRAkEVeIRmdXlRjHHsUum3T0UxATBY3N3bWMK0Qjt6+2svPshdkAe8p55+Bzrr6qqm
 xxncWQUYd9QBjSIz55SGYlllDa9/zQC3qq/x3evXHdBd/vkuQPevtg57cF+Gah0VUxce
 LJwn7h3Gy+3Tn8J7XXBc8aZDuiBT2lO41oxFS+3snpIa1SSYUDgc/E1aMnvXCH+okYpA
 68A1MjC07RBGCDfpjhsQHISUuXbBwPBLaWq+AQIRffu8Yttm0Vcicvu0Fpkjpu+l5LCj
 Wang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771944061; x=1772548861;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oWYXEUEifFZBMHeVmrbJAPnEJvyyfnEVusXUsSRAp9o=;
 b=D52rr1hMxHtDOZcbBZu31E+dzvqc192GLdWvC6f6VHt4w5yeub6rUIG2lny9seiCUA
 /mVfha3kQ5hp7WWzkX+KS3xo1jlY5zCJt1h/KtQWV/UuShnsWlzB0f1LOmT32xCrNFH7
 HLc/VSmTTnMwgXRh2d0KKceAWT0o070RAI7mkh/0IORNMkTLEHToH2zF9veB3fXxph4c
 BDmCtnXBwlqeFAYiT/UENLPTSGavW5ggvrbwxXW8273yNxpyiPG7VfWO/xxJIgPpRUwq
 iRNNd3y95J56itXCPobx/Q9hjX7z/fZItDTnhCiMJXde/yW987P4jc00uXoxHsqLH26W
 8S3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Q6X1+Hkk40c/qfyIohPegONhj13OOit8CT2HwEkSDT0YajI9ggSM6gZGD4u6Gul6ilk=@lists.linux.it
X-Gm-Message-State: AOJu0YwAG5vvNPdZLJDBWY0fzAQxZkTzFiuz2/FZSNG1wKXVFERWr96C
 0c/JkV35R1MtwBOUo8d6b36xk/6UFe9f40or+t1yVaS7Ipx9biiV24Rl9B3t9Ic/C+Q=
X-Gm-Gg: AZuq6aJpLesnAOdpLtnsgD8NMno4yDQA0elEFlklvIFa51guh85qfcl9ycvANKqtPKZ
 OC9RaZqcPZ4TmeyvOX1F3fAFJ0mQf9INu6EqdW1nrtWWCEs/cBHQi2bqNxZNohBwSsf+OF4smBM
 l5SsD49Xe4+VO1mbwoWS6pHqg8PWlcn+IW98bGYOxrwEG+WOcJJaIoFoo0jowYPWQWEMYSJZBon
 4ofLk1hHLYEfyv4mTZm0nnA0cEKSlzt/Yp2Wle361CyPhHOzbo85xLnIS9YBiO8AgoeVU6ve2Ed
 KEjuQrL8GebQlunvOrtkHyICH89H7guwKCXT5PNwUsNCjK1H9z5sXtH7Llt789ceUyjc3xEp/Do
 K5cmHtdCgGJeiwkEqfuWd2+mgZkwRKlcPB1ABpBdDGvTIXI+Me3KedGNzjZx03U3dg37Yx+q8H3
 0OHciJ6kq3yQdUxoW/BEsP3Gk+
X-Received: by 2002:a05:600c:858b:b0:483:badb:618f with SMTP id
 5b1f17b1804b1-483badb639amr25325995e9.25.1771944061558; 
 Tue, 24 Feb 2026 06:41:01 -0800 (PST)
Received: from localhost ([88.128.90.16]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7141e4sm3227575e9.7.2026.02.24.06.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 06:41:01 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 24 Feb 2026 15:41:00 +0100
Message-Id: <DGN9QVONNXB5.20SY0XBZS3RQC@suse.com>
To: "Martin Doucha" <mdoucha@suse.cz>, <ppavlu@suse.cz>, <ltp@lists.linux.it>
References: <20260220154742.54150-1-mdoucha@suse.cz>
 <20260220154742.54150-2-mdoucha@suse.cz>
In-Reply-To: <20260220154742.54150-2-mdoucha@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] tst_fs.h: Add TST_TRACEFS_MAGIC constant
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.com:mid,suse.com:email,suse.com:replyto,linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 18E03188818
X-Rspamd-Action: no action

Hi!

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
