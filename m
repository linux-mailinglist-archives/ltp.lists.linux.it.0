Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENAWCTV8nWmAQAQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:23:49 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE31C185462
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:23:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771928628; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=6/OSAGRZWAvjNl3kFJgF6A24QYkaPi+CCbjotJgikcw=;
 b=ayULMKirKhrV3bjVGCkX0W+e/K3pJ+maU3kxaN3Gr7kO928kvE898DR1lTZBe4b6XjM5x
 F+13AV773+uVvfWp3vhtrNvjWmPqxbDGB3U6oj2xMwVYlIjz2rqUq4863UgXTUqkIDmlxkv
 y2QLt4eHtDxY7RdKOV60ev+d2g2Sh74=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 577A53D0ECA
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:23:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F226F3CA177
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 11:23:35 +0100 (CET)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 92A3E1A001E0
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 11:23:35 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43984d7e49bso493879f8f.2
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 02:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771928615; x=1772533415; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05bvXVPxl8Y9/L+8LkYUodN7Ar04rgjurLTmdvGhock=;
 b=gnK0xTUxGn43iGkyIzrFtx5ziSAjuQ+qVy+rT53h5eIp9934QnpgvSE4sBwPtqaoeP
 saW4j7DTpwkeI6hgxTntWHaawShUV1/6psNvov/74dXt01Gfm3SXgD1hlKk7vG0gioei
 KbkdPHxSGCgLvv29MrHf8jk/VamrxeL8x7AN5eOXw/ynxe2xrEg3QvkzTFW0Q8cC5VFJ
 ZDuQRDXiinomNn8gILDsY2ufwug9xBtkbjTMs43GVPtEViy/vnQzJWXLUukixcqi1rBE
 6RM+4Knd3PLHzV8j+CSs8k2zO56xN53EBpLakUZOr6Vs9LNDKxeXHnU1MRHi7SxclGkX
 sSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771928615; x=1772533415;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=05bvXVPxl8Y9/L+8LkYUodN7Ar04rgjurLTmdvGhock=;
 b=TkW+NmD39AcERh2y0GDH2dbi1Me0/Tte9Ec6lIgsK+d/H0fxrSO2U326laDw7RGsJX
 DswtYv/PKfj44GJb/aUMY58/hf40IyE+6yRUzQ16YLJ0iZab1J2oY1XHKGiMwBnUChD2
 oWQMQ8GdV+iq9DW5OjKT00wUEPuKYYhwElfca8Nje80vr2ARkq/WMboekyxlIXiXcznV
 PO/eig9LBmvyDQWfOBg33wD2aAnbTu4nQu7LNIcK0EIz1ZpN4+cktmWmEgFFPnMi0EUM
 iqLgqvTgr0YnFJ8HReMOQVqOb6WalYXFJVeJA+FEKxPT/XY4PSIozTirOKERAV7k3AfA
 jKlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0VKI8D1bE+2PrXdUmqXvcHaBM1dI/xkDKBwMW5zk/F/CMP0oxbJK6A210Ty7/g+W01h0=@lists.linux.it
X-Gm-Message-State: AOJu0YwXMx/wK8DDDHV8MPP8qWu5MkU+uBoU30LdsheYBvjTxxSJ/mAy
 m1b2C3MSG8oESHO4OilXQoYTd1q/vAUJ4P2eBlLUU/lvIFxNhk8T0ngp1gs663mmN9E=
X-Gm-Gg: ATEYQzxISXnI5TA5fqCF0URt0IOBKG1DGwG9R+7pq1b0xTypaXnfG+3/+21Zl5ooYdr
 5xCIg1ofzh6K0UmFzCuLrFlBCaOHes0ta3e9MPDz4kVb8QT8MSYhm7J+JLVWIU2nEtxlLgt5rRc
 il4KPE5UkbXHSUTackYf/3bZCUdU1MLhhEO1TVgx7C0+S2MOyLHFN/c7pLNMuY7jXCJMdFRWbfX
 lNr95WWapQkbvJGt6H0ydP/EA55g7j6FEN631CHrRrTUgv7sO5clljff/pv94I9AQQoqC1R9Gjg
 u3/7ATjceJY4jY11AybJDbujLF50t2kxIQhGyoEO0eCLZ1hH3I5Uy9S5XnST7khVM+iaYIFpihx
 OYy2v14ZVJRc3XcUnQEgkj9Y9qhNZ+jQ5jdnacphOhLY3jvZIAuJ+LVlNPJye5iaAORA1xPqv7V
 rdW4yzBMnNyGtvlTrZLR1WaAuozgunAnFD4xHMIDeSgb4BrT/jzRgO5LmvZemlVtBJi/8Wq3H7k
 09y3biTC0qRnfoN7zg=
X-Received: by 2002:a05:6000:40ca:b0:436:233c:c7c1 with SMTP id
 ffacd0b85a97d-4396f15a797mr19998119f8f.23.1771928614969; 
 Tue, 24 Feb 2026 02:23:34 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970bf9fb2sm26673602f8f.1.2026.02.24.02.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 02:23:34 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 24 Feb 2026 11:23:34 +0100
Message-Id: <DGN49RS7QX4M.IN1QT4GZDLNQ@suse.com>
To: "Andrea Cervesato" <andrea.cervesato@suse.de>, "Linux Test Project"
 <ltp@lists.linux.it>
References: <20260224-kirk_4-v1-1-6f706363fc4d@suse.com>
In-Reply-To: <20260224-kirk_4-v1-1-6f706363fc4d@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] kirk: version 4.0.0
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
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
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
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: BE31C185462
X-Rspamd-Action: no action

Merged, thanks!

To 
   ..  master -> master

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
