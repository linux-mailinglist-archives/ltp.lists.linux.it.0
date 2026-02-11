Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFSZNfp6jGkcpgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 13:50:02 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FCA124863
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 13:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770814201; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=0PUkcZmiATp82mj863foJLlX7SOQYnDAtRWyOqyOJSc=;
 b=GpmQMUHTPbwZShGyPVniKH3sMR3ep6CuNrOLYIHe+m5q5thHq75hmUQivlkIZothc1ZR6
 ZFj2QQfaPI3yvQTWv3fmr8l53YrZgAk86sLMnRdlteC6FNw8Ms16E047CYGz41SRLol6qBw
 kRGuv0Xfx3gV+ORAH5CWiR6/lOX+9JM=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E45CA3CE418
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 13:50:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F26B3CE229
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 13:49:49 +0100 (CET)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3750310008F6
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 13:49:49 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so28704245e9.0
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 04:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770814188; x=1771418988; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yj1SmcJgNxrvHY8Ht7XVssrnuBrCLqJhe+LhMIBhyYk=;
 b=fQcE37LRpNxHTdE05MrfZ+4jTZylQDOezS0YZf3R8ZryS49Z0qC9BJacdwXYtpEMQb
 u82zkd8tR8dz3hHy4OZL275LuJCZkRFud7XQj0mOI4f0W1/i5VFx1w+uzBH2Rb8jZSY9
 UTmfCEZDPn5Uy5XbgqeocK8jTQa2YWOs/UhZ8g8+Kbv4xLcvfZBJ48FSAtTC+vH8G7Qh
 lZ5hhjyfT8GdzYFJajrXiSvair+OeZ7CIIcrwykaK/GKc09Dg9aYGm6/l8+Xm9XcmxY+
 K8kle/lj/NH2g2rmFL5GzePChKOqAn9x0Bj95S4MScT6/sJVMUwJct3hQbroRLxi24td
 fG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770814188; x=1771418988;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yj1SmcJgNxrvHY8Ht7XVssrnuBrCLqJhe+LhMIBhyYk=;
 b=TQp7amW8vUAA3ELTLsbk1QkZomFbXkK3U6Q+oLI+i2Zre2dlfg82nNqjvqZWLSRZ7Z
 nyUrQ5RuQHuw5B0Y2y3fvrNz4ERduTY5/IbYVEjQ1Xlpw89aUDf5MAPwWdbF5IFYpSMb
 Xxqp4/wmOLyQT6nwJFJiXDd//MhkuPUOdni/FowISiIT/37mOyGLG+Dwuk1ztUR57Qyw
 QkFUKM8GyMGpoZqW9nwHPkdMCZ9QXunwxEkALwQS6AaAOKrhBOdlz6lbnM4KRM2LHJsH
 s5W1r5Kkk2mBM6onClTbJaGPDgn6FHFA3wh1ZkMaMC12+sKWVzRxesZz4OIl5fyKgfYf
 8cjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlKKbvvsb7vgJS1PUkt4uqXHjsLmhStGQE6sanBLg/Lh91p8TvcqgAmXBv87RjnLV0zRY=@lists.linux.it
X-Gm-Message-State: AOJu0YxamDeZxmJUlNJGWSfLYjTtiQqBAnan66ukD80eRWfNdKqN4B7L
 KTxNggTzuzAP65D2g8Gr9nySX5udJTn0EaX+Iiaz8IW4xelKts8mGKmHCbgSAj1K8dGve85zQSw
 8i+RKplw=
X-Gm-Gg: AZuq6aIUwVhzrWg6//adlS6FCRFiPMOGCAaKq7i00cV6GRYQG5gEVOAE6ntbSUaUgES
 wzmVhLhsEq7/2FSllgF3+xuEXUklZ4rbv3SS2ttkbY0S+eoBVes2tnofsru4LMGuj1ZlhIIv4bC
 R8fbCLnnxZWf8JOWkOfVVpkfRgSG4ErFTzBYCln0zc8FV1yojAvWx9t67gTFXuq6D5FXcIoeMRS
 Cr6yQIOuYIejOzQH9H49XQwvUpcjALCNi3LlXL2dJKuyb27IvdpiKAoFEPIIAGmLOpHZFCBZDZ4
 qnvFGgCJda7wPhaLoLDrHePYItDaKVAu922iPinfnKI5KP2w8wFNRckQ8pNtUQhr85Vu4ohlUVO
 KwO/uc1CcvgWLCNVaYEFDGlX2+6W9g+/neB3WuqqGC4jIuBOOF8wmiUazKhhhYwqJ3/LdlGYgQI
 HPq5aAnyyne4wtvTid9I8Rxpkauv8=
X-Received: by 2002:a05:600c:6217:b0:47e:e91d:73c0 with SMTP id
 5b1f17b1804b1-483202310a5mr248172205e9.19.1770814188552; 
 Wed, 11 Feb 2026 04:49:48 -0800 (PST)
Received: from localhost ([37.162.249.193]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd20519sm69268725e9.15.2026.02.11.04.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 04:49:48 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 11 Feb 2026 13:49:46 +0100
Message-Id: <DGC58MKN9IXE.LDH1GXZURHN@suse.com>
To: "Martin Doucha" <mdoucha@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260203125029.15413-1-mdoucha@suse.cz>
 <20260203125029.15413-2-mdoucha@suse.cz>
In-Reply-To: <20260203125029.15413-2-mdoucha@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/3] openposix/aio_cancel: Add helper functions
 for setup and cleanup
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
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,picard.linux.it:helo,picard.linux.it:rdns,lists.linux.it:dkim,linux.it:url]
X-Rspamd-Queue-Id: 83FCA124863
X-Rspamd-Action: no action

Hi!

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
