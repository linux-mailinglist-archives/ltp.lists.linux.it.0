Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP2/Mlb2lmndrQIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:39:02 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CEA15E57D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:39:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771501142; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=bfc8orr/Coiu8KbTMzbW5XmYIcfQf/dSW8xowU/RY/A=;
 b=G21ikgm1jCZ+e5jy9sSe9OkVNLJB6w5F+LxKsW0fjQR5zcQMAbr04UXCZQjohCFQA/pZD
 JVu6ldNVUyqRGhb810iaxC4jggp5rfeIUK9y7MEYZ7cImQd+QFasuIjLugZd3AI6ETbO3nd
 48IrHu1ZFN7eQLeVucUA2ZdOSxO+7zQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00BA23CA4ED
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:39:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A7C73C00F5
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 12:38:49 +0100 (CET)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D890D20075D
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 12:38:48 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so7820655e9.2
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 03:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771501128; x=1772105928; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y9YI0OLelb+YDZpAAtSKY3DsUQmeeDpuTEmep42nfY4=;
 b=cuA5RsF4T7/2Nc8npVkjx9qiFH9PMbkFULlJblVU/3AoM0UOBJ8md9diZd6DudpFHw
 WZDfEtrr1IwR/UrjuwrdrjmQ500v37mgcThS+XSTBUCLHTF9oKNkKnI3adoX756yN5T/
 jUXUvvwM5o5L64kJjRzoeRvG1dXjNlbNLA7M+4G9vGAxSE6CveT8+ch+jqhmN+hnB4Lr
 x4/M7j1wpwnHeB4bgbK+wNMkVMNgRBoVQ0HMhfxkxW2z40LZg7+ZlDunzLLj1cJFEJBD
 CLt6398WkFiz2laORL6EaLnSmyE6st095I2XzjRcKrIR6OHkwCQ/ljufWx559R5w/Ns2
 ZXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771501128; x=1772105928;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y9YI0OLelb+YDZpAAtSKY3DsUQmeeDpuTEmep42nfY4=;
 b=bI7kgLWyeB3PNjUh9lTCBu8U44r2tH70rGhRI8c6H0+GSRThCEYYPz8gQcIO0rOUCT
 UAkDS5lG2Ky3OZ2HrWUk3nN1GnSx+y0M5E0YGls7fA2X+DAT7D0nDwe2qEqKCEqAtor/
 nL4xqoR7fiOhZxETBSv9zi/X8xhC6+SiL8RaTSaUzLWOi9BcTNQnwoRFLGmS8cdT4cxe
 1fxMgfpg9FFkhbK1eSDxC/wNR7Pl8PFLMwqBp3k1zYG0liR2q4CgozRVNFvG01AsobtT
 xt1qzE8X7UAR8wV2/J12WM5fd09lpld0M+1nJ7lTFRow1YHOI2Sl769Tjp7UOUcnQu5w
 sdyw==
X-Gm-Message-State: AOJu0YwtJyYPocjV7piM7vgCa9zTF0q507x0odKQ1F6Gx5W/dToM/wQf
 mpBc5FMmMbW9aIiOF5wHJDNig4aS6hYFrtWVKbxEHfcqnwCDbS5JUCpVfD5g7wx4sAY=
X-Gm-Gg: AZuq6aJeGCtF9s/gZJzqBRadlzitq2opdNdDm3D/JrSkkpMpnBO7kTVj07TX/y1jk/M
 crGbS1A+hQPEZXLUckFcg9CJq3GNNSlzLOK+TWnRV3NWfxn2sLPw4fSOkpu57iA0iPGGVOaEzQz
 xyQNqeTa4HuxiiNteaf6cKposezFmUVmh3keLMn4VQaKjLjxE8rQ5TaezmRVvldbcn3NRHtIxq+
 5Q28SZ2hLsooV92jNUL5Ry6HquVEGC0K+KoMzcXPQIPy1JJvGIlczH5V/VIYgy/TTV/g2p7r6Mg
 0fp71U+EcX4+EKtpdn5/lCces79NTu8J3FgEa7k35vrIKjJbu2aD46qN1qnqt1fIdb0CGLWB0/z
 ZpBdI6yXQVKdUEQDenOuW1m6gbZhhKxmYaNfnFpleg8dow45smLwnC2BEpYOTWMpRd4QUpoa9R0
 HILetukfHWxG2wheOEiJx7qAqP
X-Received: by 2002:a05:600c:5248:b0:477:a54a:acba with SMTP id
 5b1f17b1804b1-48373a3e98fmr371767315e9.17.1771501128256; 
 Thu, 19 Feb 2026 03:38:48 -0800 (PST)
Received: from localhost ([88.128.90.50]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f9781d7sm17954075e9.18.2026.02.19.03.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 03:38:47 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 19 Feb 2026 12:38:47 +0100
Message-Id: <DGIWQMWG9MQB.RWI2QQVUXS6N@suse.com>
To: "Cyril Hrubis" <chrubis@suse.cz>, "Andrea Cervesato"
 <andrea.cervesato@suse.de>
X-Mailer: aerc 0.18.2
References: <20260218-kirk_remove_minus_u-v1-1-83499b7254fb@suse.com>
 <aZb1ZRBuQs7Wwo_1@yuki.lan>
In-Reply-To: <aZb1ZRBuQs7Wwo_1@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] doc: remove -U option from kirk execution
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
Cc: Linux Test Project <ltp@lists.linux.it>
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,suse.com:mid,suse.com:email,suse.com:replyto]
X-Rspamd-Queue-Id: 76CEA15E57D
X-Rspamd-Action: no action

Merged, thanks.


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
