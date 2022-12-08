Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 568236470B7
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Dec 2022 14:22:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E757F3CC055
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Dec 2022 14:22:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 75D143CC039
 for <ltp@lists.linux.it>; Thu,  8 Dec 2022 14:22:46 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7E79B60082D
 for <ltp@lists.linux.it>; Thu,  8 Dec 2022 14:22:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 75BB2208D7;
 Thu,  8 Dec 2022 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1670505764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VJBacr7hG6AX+uQgnYSA4VIoGS9YNsr1rKogittmZY=;
 b=S0Z7h7WHfAYyYqK201JWJMYzmF15P64/YszOgvINyIb7zlLK0BuZGiVVbo3UApRC1YsCAU
 NjqkFg5cgBuWWRWdbJU4zWJ0CcI9aS0kFBHe2NvrYDYByFagZRIisRLbbfXNX6qa4Fupch
 4KssLoEWQeUDDWsY+/quWgZ5GJhPovg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1670505764;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VJBacr7hG6AX+uQgnYSA4VIoGS9YNsr1rKogittmZY=;
 b=nPc09tgc/6Ot4V7p4S7gUCylbVg8GvO6oz88mBdfKARcUkSRm+wzH79Gf9CTfsU/7lQzsO
 8XrhvgyfD5gcfSAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61E74138E0;
 Thu,  8 Dec 2022 13:22:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AUEzFyTlkWM9UAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 08 Dec 2022 13:22:44 +0000
Date: Thu, 8 Dec 2022 14:24:01 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <Y5Hlcc86GF56GY6f@yuki>
References: <20221208130348.65693-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208130348.65693-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] config.mk.in: build.sh: Add
 -Wno-missing-field-initializers to CFLAGS
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhCj4gQWRkIENGTEFHUyAtV25vLW1pc3NpbmctZmllbGQtaW5pdGlhbGl6ZXJzIHRvIHN1cHBy
ZXNzIHRoZQo+IGNvbXBpbGF0aW9uIHdhcm5pbmdzIGxpa2U6Cj4gCj4gYXV0b2dyb3VwMDEuYzo4
NzoxOiB3YXJuaW5nOiBtaXNzaW5nIGluaXRpYWxpemVyIGZvciBmaWVsZCDigJhuZWVkc19jbWRz
4oCZIG9mIOKAmHN0cnVjdCB0c3RfdGVzdOKAmSBbLVdtaXNzaW5nLWZpZWxkLWluaXRpYWxpemVy
c10KPiAgfTsKPiAgXgo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBhdXRvZ3JvdXAwMS5jOjIxOjA6
Cj4gLi4vLi4vLi4vLi4vaW5jbHVkZS90c3RfdGVzdC5oOjMyNDoyMTogbm90ZTog4oCYbmVlZHNf
Y21kc+KAmSBkZWNsYXJlZCBoZXJlCj4gICBjb25zdCBjaGFyICpjb25zdCAqbmVlZHNfY21kczsK
ClRoaXMgaXMgYWN0dWFsbHkgY2F1c2VkIGJ5IGEgZ2NjIGJ1ZyB0aGF0IGhhcyBiZWVuIGFscmVh
ZHkgZml4ZWQgc2VlOgoKaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/
aWQ9ODQ2ODUKCkFuZCBJIGRvIG5vdCB0aGluayB0aGF0IGl0J3MgYSBnb29kIGlkZWEgdG8gd29y
ayBhcm91bmQgZ2NjIHdhcm5pbmdzIGluCm91ciBidWlsZCBzeXN0ZW0uCgotLSAKQ3lyaWwgSHJ1
YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
