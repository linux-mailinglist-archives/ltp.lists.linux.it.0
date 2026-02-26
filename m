Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKjnAGNqoGk3jgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 16:44:35 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 804E41A9059
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 16:44:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772120674; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=kw46yVcHBujsTkQCrm8+QIqxzJqZhaajaogUAIvm+Yo=;
 b=SsfIE2wuW0vsfeqyihrph3/2gBzjKK8YVuOnQ08dON78+dE8zO6vMdCKxMqR7tUmIDVIp
 cseI17j+H/ObNrj4/3RiCti1rWa5JOQ6cKhs+EQOV/50Cf9RbnWYppVAQtERIsdKJErubo9
 nlnz4Rmu+og1XHiIDOJX/llR+yn2AAQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 269083CBE28
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 16:44:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0A4423CB7A6
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 16:44:22 +0100 (CET)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 627381400C7B
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 16:44:21 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4398d1f06caso950387f8f.0
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 07:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772120661; x=1772725461; darn=lists.linux.it;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jb8k6yC2pMRfEE/1Kd/ieRFSJW7jNQ1zM/ACwubKEyg=;
 b=Vlo2k9MrvvN/86pJ85iiCtfUrv1Wg3kYaTyKZR6KvzRROpO4bLgMoUGltx5v6Q1mHG
 k4f5ZIAicaizaxv0NIkrcsuQrTL+XrmDEe/H/GLXnDX9gMmQaERQn/3/c5A1/+0e09+u
 +2Uy5A4P3BSxnhr6BYnCiNIxrkeu2cNZF2oxxW1auLTjtUn016NcZtZ1tVtYqKVhfHmG
 pU3p9hoiTG1jZkO/Z8eqOoUIL00/OM6MqFgaOg2tthAouLRUi8lOqrFfJxQu2H5/s3xE
 GTuX/FrSor4DKYov4MXzBqmeCDScZJoe+1Ifu6f7ASa+81qMM64WFCfA4LrH1VQQ++sq
 WRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772120661; x=1772725461;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jb8k6yC2pMRfEE/1Kd/ieRFSJW7jNQ1zM/ACwubKEyg=;
 b=Q/kX9sTdorWDCKYgnew13O0JB1yMrt1lxkuiFJU3Jyr3VfC+Mglw4e88ra6ybDg3XG
 bRM4x198YTVwnhc+o8sTSeysDMPEsbItVpF7NoaDXfmms2qmGJu3GoIbq+R+c96vXh5B
 2wyi2KmfRPNXxavnwR4CJnyzWokCnvAruDAYo74/9tClNy/aiZXKS0JMHlP5AWxKj5Wv
 cuYUgUw2Vfq8c84VMX8MLAuvivzrcEYwKRdlp54dSirUeEJr2mJNbvjY24DU2JqZ8+oa
 zCdvq/U2HRv45C07gtexT/FZO5aIRQmThZW7sbrlhrueY0811UWKGSB47qhjlNFg3s2P
 ZA6w==
X-Gm-Message-State: AOJu0YxTC8vCYerDfmC8bfmPoUK7spMq4ISRd8FIqnikIT+qu2WPqKZ1
 4rbjaYI5B4AfxaRL7iRSq4T9B/c4vJMb7s237x2sSqYMhgYDVT2w+XMR61JNOz8cdkM=
X-Gm-Gg: ATEYQzwk1swN3Vs50/CR3n6Jg9oH91/xC/slIKeKhHVTfSfmOJhqOCu2MtvoHO1+X4d
 xc0OJqlXDhdJ0sHlRcf6IpPfdooREvSB7xBC8q6DPYDLLX0AgVvVP9rpuIJWZKVMGBUers/Tt2C
 y3TT/jkTLqacvjiNRaHibrrHsQ8ULxnydZCk2GLY6KktfRnVyvmQUzZVKFeTPR9/gWAji/rAATO
 4pTddpWPxNOpJF1UXA/lAR3by2QlxrUcIg+1OmumFy0xo2Lkq/f5gCIF5ZKq6x6yCpgBVWifnIU
 oNTtzJwLaLk59Cw5gCTTfA1N8pJ9v/kBSOM3dqlwTtqYhUdqB769/xlMTj9MPtmIA9YF5Is1iul
 f/3hKdYCNasmWUuDXHgzYQlhsjSbR0CvBo8NZ3YAQstntL41uy3j395P0K+2IyuTwdMFdfhJLqU
 ApId5ST1AwBwU4RnjAnIbDBXBq
X-Received: by 2002:adf:ef8b:0:b0:439:95fb:d8e1 with SMTP id
 ffacd0b85a97d-43995fbd964mr5446703f8f.16.1772120660550; 
 Thu, 26 Feb 2026 07:44:20 -0800 (PST)
Received: from localhost ([88.128.90.35]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765b6esm364704f8f.33.2026.02.26.07.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 07:44:20 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 26 Feb 2026 16:44:19 +0100
Message-Id: <DGP0CG3J3QK9.1M9KCELAS054F@suse.com>
To: "Jinseok Kim" <always.starving0@gmail.com>
X-Mailer: aerc 0.18.2
References: <DGO4558ZMLNH.3U00SNOHLUVXJ@suse.com>
 <20260226153231.1513-1-always.starving0@gmail.com>
In-Reply-To: <20260226153231.1513-1-always.starving0@gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 2/2] fstat: add test for multiple file types
 using fstat
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 804E41A9059
X-Rspamd-Action: no action

Hi,

On Thu Feb 26, 2026 at 4:32 PM CET, Jinseok Kim wrote:
> Hi,
>
> Thank you for the review.
>
> If we switch to using lstat() only, this test would no longer exercise
> fstat() at all, which changes the original intent of the test.
>
> In that case, should we consider renaming the test from fstat to lstat?
>
> Jinseok.

Sorry for the confusion...of course. The point is if we want to test
inode macros or fstat(), and of course we want to test fstat().
According to that, we should correctly use the syscall. For instance,
when using fstat():

fstat04.c:63: TFAIL: symbolic link: S_IFLNK() macro does NOT match
fstat04.c:45: TBROK: open(chrdev,2048,0000) failed: EACCES (13)

And this has to be fixed of course.

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
