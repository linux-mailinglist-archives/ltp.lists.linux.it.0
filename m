Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id m2KRHmOxlWkHUAIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 13:32:35 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 180011565BE
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 13:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771417954; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=VclOY4iVUQAW3jk3fIZ/VswywvL8AqKpeHz/By7plhU=;
 b=LnS2TrGP2GxXgE8366aamDUTiO6U7zFfaMR5hylepWD4HzUnycPa1NrjvISdQa4gYHdCC
 NDiRdr/KqMXOoGHVEt+9fvEOOuO47Bnq846344boBr8AvPxMBbE0Dagb4cn4unJd8Bvr5zf
 SoEQzowE2A7Bi0+ENMpvPgGLv0NG5CQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80CB53D06F4
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 13:32:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F2EB3CE321
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 13:32:21 +0100 (CET)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B8CFC14002DA
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 13:32:20 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso46396605e9.3
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 04:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771417940; x=1772022740; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z1GPcIb6UzOJ2H4zB2yq2sRyAyk7mk/u24BhHc3dywo=;
 b=JBhqar6Ti+hqqoF0bWkOiDf1FpB8LiFYh/e1wTJZwNPEpOol5xZGbE4PvHp3eS748Q
 crCfz/Ls/fweCGyYfXZjbV94r/xvC5ME0n9wv1I2Aw9TSnQgWX40awxAmYlexiZwhf6M
 jpPRCtNHWr6bcVpx5mwmCrrR1awuieWxyBL5YsrUHDI0XkNBYZyZUrbkSxv6nTnU4dcX
 9LXFjvkXtG2Mn7Rm/eVo3fpnjKFH2PqYeg5xHCB8kz9a/du5KiSdFj8AfPweu4UaDpNg
 8MIQ0L9Gs9DTONPqeeC/VxL1U9UIuKySZ79g5ZymoH47YmQgXWeAvl/S5h4GPWHzjpav
 eE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771417940; x=1772022740;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z1GPcIb6UzOJ2H4zB2yq2sRyAyk7mk/u24BhHc3dywo=;
 b=QV+xMB3eXLzKiOmBTh5De2BMT/yRV29+J5iVyLFQI/YCyfA6jbXFX7HkTUr8VCANfc
 UiAK6/2FnwSEEAp/9n+Jo1VErTsmDbFA0/hN/OLUlPXKFWaHv4mRaWv+edgxOuCPNSj/
 Lj9ZmSfNZ1jy9GyivKvHMIxsxQ24vMYuw0tkXRRoy4D47wk3iCuFtLQ1PxJ4cGAdq1dv
 ohpl91tkqAB4oX45b0XYiCK+RjbLlyt7ygNFgLeaH5Aw6ll/Lf7zZ8xLY9ZXC2hLXCrB
 SJhVeqy6l8E4kq12DKgglyJg22McC4izRVF60DcQ3ekBr7zhaUEwABuDhj86GCY94EeH
 b/iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKR0byAZPQIO+P6DCbgA5naUFqTz7f2kSZ40bSsEfSdRqcg/EAvlifi8kFS9vH4253BPQ=@lists.linux.it
X-Gm-Message-State: AOJu0Yw5OjC5rHCgrX4OY0a+VeLD/Bx0OEAEKSKpCyv5unAXYsycjK8Q
 f/T5N9gaO3eT7QWD7ZHcbH3SLjc0TxrE2o2CsKOml1UGOYOoQ1fRxrJ8q3Kv1AhG5M/tdRQlGBl
 1qqDj3Qc=
X-Gm-Gg: AZuq6aIzxUo2xDER5PReJj8+tBL+393JuQuj2yNoTOjMnvX+FPBF6cZaiebLlI5zPZo
 u6NedLxZUulNIpJ3mE1nH/jg5nSPgGjnq79emY8J/LzTFycDQbe+PYACseR7iYLv77rf9RGmxBj
 7kVmQBoim1yWjSQi0vtcHLIJKI07p8hUoD+cmthTvts3hcNu4AcF5RemAQO9OCSkxceF6Xi/fO3
 BFfwp1FjDIfRXAv1wb2cYRpmU9jAn6BUV8M2xTWZflPerRS/jPROVO0TilcX6yIKgjElmsrUBoX
 qHyH0QfJnWy+rUVHNpdBzZRqwDchanE7PFXZDly/arEUWETTKh3fxq4VTRwGBOkrVlo1E/QVEr+
 j5kvWxIdoileNWFHYm6rVjFBMUTbIZArvWDJDivK7wWPzbrMgqWO8Xnv/DYI1ApJkSkoxjS8F21
 6V6Lm5ccsA49g4viNaHK8pGDQpiN+ybohckDyMS81eYGSqLsUoB8ExS7bbPf13Prf1r3+U6zNge
 luOPnVRauytAwuLiiY=
X-Received: by 2002:a05:600c:6389:b0:477:7af8:c8ad with SMTP id
 5b1f17b1804b1-48379c1f4d3mr267260265e9.31.1771417940054; 
 Wed, 18 Feb 2026 04:32:20 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d82a4c4sm895776765e9.10.2026.02.18.04.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 04:32:19 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 18 Feb 2026 13:32:19 +0100
Message-Id: <DGI392YIX8XR.2G0TBOMQUEJU4@suse.com>
To: "Stephen Bertram" <sbertram@redhat.com>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260209234418.2810671-1-sbertram@redhat.com>
In-Reply-To: <20260209234418.2810671-1-sbertram@redhat.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] mq_timedreceive01: fails sometimes with EEXIST.
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url]
X-Rspamd-Queue-Id: 180011565BE
X-Rspamd-Action: no action

Merged, Thanks.


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
