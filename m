Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCiMOvymnmmrWgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 08:38:36 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14A193947
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 08:38:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772005115; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=MqCmfFSUfnGn7kMfKlowlZpWmPxajEtTbq3zIJg+mlY=;
 b=cCkwXddKKGZNsTVo0L1IL4wTAbCWWH/e1QVwvaIolq2ukFlq3OF9maYDZYNcc96oIRntr
 vycxhyOfgoY78Qr9cviNubhsHi3qMzbadAeAzqwuPwq7EK+bU9LWD7orZ3tiXGamAxLVnxs
 jpO7RdSATHZnIEUMrsClzPmtQ6a+qCg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4ABE33C52F4
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 08:38:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A4133C0528
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 08:38:32 +0100 (CET)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 22AFE600D2D
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 08:38:32 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48069a48629so64672495e9.0
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 23:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772005111; x=1772609911; darn=lists.linux.it;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B6ayJf2PkCCGMtInS8hY4RXNsUgSUGrcRFo0bw0k0VI=;
 b=OsCBSTQWT38SP6uGqk/ZOq156wS8AricjDg7KNK75HLOgqMBTl6gD8yahyzrUC87Le
 OatWdKl0ePRv3iMi+d91D1TrCk25eKsLy0KtkIif5KL8Kq9UDVp6ZsHErw0kkEIUkefS
 NYHhTpM18DhupLtfgP8IZFj7hXT0h4Utuc0BQoeCYtoC2e1CxW3mVI5ate+f2haWB7rY
 1nf7fepDaQdoSbCN7d31qmS1Dj4ZGABZ/4XIpIbVbhgMBGguCQYsMXTPj9zV7nDIAon3
 tX/1oUQhQ2G4RKa1+UKaZmtsQYpJOjJVXH4Q785wRmyL+X/qVJ5b1Cyh/oM2uwEyjX1m
 jvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772005111; x=1772609911;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B6ayJf2PkCCGMtInS8hY4RXNsUgSUGrcRFo0bw0k0VI=;
 b=nywLHJUAXOL9pQNccF/MrMKOBmhsdDHvMHUruzLqfZj/mp1OoTXPI9/mJ0oSoZeu4D
 mnuu+TIGIhXdGnf4JuEMSs4KxK4wdBxsg5NwndoJ48MUc3dT6lEkdL9lpXE06FuWWdrl
 O6O/Z1YDBcofHSuPHNNgmPo41O56KzOslIWtxJ6tHdTa+D4cReufytwHf3AeD9hpWUi2
 /CKKKL7SeU4v1qztcPfxgkvvnhpdy9LVke4YoUef909BkdvKyGwhNXlrkVwLHEkCkJaK
 XRGz8e8JkoyBsDUY0LBSH9d6LSYFf+LhB0+mRIKfQnaL4vb1Tt5fCdgd8mQzT0Kv71J1
 FRfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYD0SYxvw6N+URRw6qb4y+6U3WJ0YC06gZcm3tz8iV7KkojDQptVgB7gIXel7+4yWaeMM=@lists.linux.it
X-Gm-Message-State: AOJu0YygP96NpSntvsNsNCKadO89+t1se8UkOfDuni6fqdI1XxepjP5S
 RvEtKtdThaHsdufwLxUtQX2+Ppw4Eyw/cjueuGZE8Ymz0s0UvBuBeM/ftXQNyBKds3Y=
X-Gm-Gg: ATEYQzy6mTc5YyTSKXEB7QTXu8IsjJtiE75W09hasbD2hYttS8zpdfg1HbDvti+pvx5
 fX7joZ94iaoYwh6+4Bf3kqGoqRILEQk5ptNgrhLuL6nArChhJX9siHJ4nyFLYjtgLfkEcLZIaHI
 2Qn+GM6xtsgUzU9waFnGdxjKuBtGMl9+cyP4zwIIwRYZTJi5OE2AABEq49mYxgYKqck0huvo1jt
 cQGI+YKbxqRPgkncXjtJRA2kmX3WlCajHmy4EQ7vbnpw8vBBjtzSAImXJQtgz8gLLs01ThOw2PG
 m4TGkLE7IDqyp1E2rNP1T+JksjYpiOuPnK8uTt9Lvpetek7QBeypCqz2MbW8G2UztGxTxX+P7gd
 LGDpzASqls7e6FW/l+fPB0Yk53kalCPslWAolFBWBP31wMiLzl7ZqsQT6rv0qjUAuQM2N/+8KyU
 hEhV4JHR7Z+DG5+u7IMVe7TEu1xW5LxUUYfDLVo8brHJpmuoqvkeiUrBfR1VWYtqxgx2WpGBvqA
 Ay5JKBFup1VnBT0Ceo=
X-Received: by 2002:a05:600c:3115:b0:483:3380:ca0c with SMTP id
 5b1f17b1804b1-483a9611795mr310527235e9.35.1772005111402; 
 Tue, 24 Feb 2026 23:38:31 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfabb84esm16890965e9.0.2026.02.24.23.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 23:38:31 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 25 Feb 2026 08:38:30 +0100
Message-Id: <DGNVDXO4X3ZC.8PDY4GET7WDE@suse.com>
To: "Wei Gao" <wegao@suse.com>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20251125044057.20922-1-wegao@suse.com>
 <20260225015044.19233-1-wegao@suse.com>
In-Reply-To: <20260225015044.19233-1-wegao@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] tst_tmpdir: Fix buffer overflow in tst_tmpdir.c
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
X-Spamd-Result: default: False [0.29 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com]
X-Rspamd-Queue-Id: 8A14A193947
X-Rspamd-Action: no action

Hi!

> +		if (unlinkat(dir_fd, obj, flags) < 0) {
> +			if (errmsg != NULL) {
> +				snprintf(err_msg, sizeof(err_msg),
>  						"remove(%s) failed; errno=%d: %s",

There's still one more issue in here:

We are checking the error for `unlinkat`, so error message should not
mention `remove(%s)`. But this can be fixed before merge.

Otherwise LGTM

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
