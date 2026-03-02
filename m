Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHvsM62opWmpDgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 16:11:41 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2C1DB888
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 16:11:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772464300; h=message-id :
 to : in-reply-to : date : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : mime-version : content-type : content-transfer-encoding :
 sender : from; bh=ZxEZX9eamfKXvwm3RC8oQ+WPGP89U44Cwbx0Mg1avNY=;
 b=imfkE4w9fplaKqitnZNXfWk0/85Q7KJIkaQSLmxnurXoobo9NxeBSFKXVLrQaFO8CyK7W
 PPOziEtxsI94uHbEKDFHt1+6JknjgZpz3zwpRymo6nWiv43IyKlkH+lZbIhljpHDC0M58Lh
 1QI4OeXZmCZ2ir2CzZWBDAm8DbzxHKs=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0A2B3D7A3F
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2026 16:11:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AADC03CD9A1
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 16:11:27 +0100 (CET)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4A0306001FE
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 16:11:27 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so40632155e9.1
 for <ltp@lists.linux.it>; Mon, 02 Mar 2026 07:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772464285; x=1773069085; darn=lists.linux.it;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=A5gUhM9TEOnn2TbvG1UFjyViJs58axR15pnhCXFcFoI=;
 b=aK+ts3b4dpD7pvaPgIJhnL2yv9IyG6znUhjwahnnWAMla5C/mVdSPm2M0ukmIYeLPp
 +d7beutPpOPhJJK84XHqukX0ZoeeMIHHqJHBIx8vBn8GF16cftlIUdgnxV9+Yq2G1W3y
 xdeLwGlsgFi4KzD/tKDpk+4ap62Ycih1duTIC06R8R3CfKhHyx7SAnlzZ2Yw1ez77twq
 ff2shsR/iKNgGMkQg0BM0yPPdh4lJw417++dNyn3yACvGZ0ueIFiBIgx1Ec7zeOXaesb
 JjWJ4BLdg30bRRhZxR53Sn9/Ot5kx3QyOS8Mzicra02bbIwB2YT6j0itRXaI37le16Je
 w4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772464285; x=1773069085;
 h=date:content-transfer-encoding:subject:in-reply-to:to:from
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5gUhM9TEOnn2TbvG1UFjyViJs58axR15pnhCXFcFoI=;
 b=a/alHth0mDd+PXNgmBgbxYenXmU9H5HH82xgo5inyNqDX74IfiVqBS+WTit3ZsIPuA
 5Gu4p1Ee2BujNI26r+d98Z43ETHCIL3Jsd3wV2GhZvnAkE1Ru0+SFiyUkZTRg8XWL8l5
 ejHkKofBFyEyL3Un3IyLgmIDV/N8G3ql9o5KQ1ycns4OmTQxwd6enJhswYyianfXBTYn
 L55B2QO6qJcJD7Gz+Wvp3S/wMau4j7BPfOWDL7W1yfUf9q8lk4Itu2xwY+XExkI7oKfR
 WklANzmQTiQJ3EuvgVdq81pqMgg2w4NslUG6uwxLUDwrgYF5M/KqQgs72QtB499WiWKe
 y5sg==
X-Gm-Message-State: AOJu0Yxj+Q6AbJdlbWhm8+SCZXeIJ2K2xyu9ML0s1SgfEkm7NiLSWuE/
 EgTCrOsl1KQiHjWxTlit9QqHk8F8caLESmNL4ABMGRVFksuJ+asRerOETn2qNuq4fSkjMsZVlHJ
 xEZ4fmso=
X-Gm-Gg: ATEYQzxy+fsVzUlXx0lDAtK3aKjaTUr7KPXHC36B4hIDyotwRox6eDhguzO1Ua2TAU/
 X4gIIEsAsh2CEoeoFWswGsYVHWHrqikX6bmAZVoqKGPWuVcAAqnfdtP8oAyFELu4rzZ1djsLD2l
 nXbjsPATKu3D2uLzDQ3rRKomhZGThxQt0fizZ0py8kPiB5dRIVDFhad9Go6hHS4lWhCyct40o1C
 6lZemVa2HbWI9nw5Imr6wuFem2P792kUskRBZRbPwg/KyXr7OiFtszCkY5/bNA452HKTz3Fm6OM
 Pz/O2TBjt6f2Eis75cbWkz8KdxeL9xYp0ekH5JVrpYxtMbqgBqeh7fyNoSOWnvZNclmJEL+0D5x
 yQIDqOTFMKo6VcO7AFeBLaxy43eu6PVEYi51sU3TvjvoUqfVDICu0ae8JR6IA+pmAS0jmQ37yWc
 PBFuX1w2aOAATK+icQQ3H4+5E+Vwx1iF8uQFDUmzMD
X-Received: by 2002:a05:600c:8509:b0:483:6d9e:e4f5 with SMTP id
 5b1f17b1804b1-483c990bddfmr228659675e9.5.1772464285379; 
 Mon, 02 Mar 2026 07:11:25 -0800 (PST)
Received: from localhost.localdomain ([88.128.90.11])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b346ccsm264839755e9.2.2026.03.02.07.11.24
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 07:11:24 -0800 (PST)
Message-ID: <69a5a89c.050a0220.1f2f98.0f58@mx.google.com>
To: "Li Wang via ltp" <ltp@lists.linux.it>
In-Reply-To: <20260301012808.15588-1-liwang@redhat.com>
Date: Mon, 02 Mar 2026 15:11:24 +0000
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib: Extend -D flag to support multiple debug
 levels
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
Reply-To: andrea.cervesato@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 6FF2C1DB888
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,lists.linux.it:dkim,mx.google.com:mid,suse.com:replyto,suse.com:email]
X-Rspamd-Action: no action

Maybe we should also apply the same approach to the LTP_ENABLE_DEBUG
environment variables, otherwise we might support only 0/1 while using
it.

WDYT?

--
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
