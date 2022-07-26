Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB8B5816DB
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jul 2022 17:56:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52F523C9F6D
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jul 2022 17:56:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7E1DB3C97BD
 for <ltp@lists.linux.it>; Tue, 26 Jul 2022 17:56:52 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D6928200339
 for <ltp@lists.linux.it>; Tue, 26 Jul 2022 17:56:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 62D4C2001F;
 Tue, 26 Jul 2022 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1658851011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//31n7RCerngDudkT4gbwO+FkJzqN3QmjCy+B0k95gk=;
 b=apRr7mDqRpXWwT838bMChVl8/Lm28OtVS0NG+05tBu3VbLFxA9vesuTyk2MAgjYENV5V/f
 sKeBAx64Obp8hs5q1FXuWc69upDCvDjh+8+smcY0fwg6mKUs4KFZJcts+m6fVGGqf/v274
 MwUhsoq1jNvEdvdtOpIMgs6+EYmpUW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1658851011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//31n7RCerngDudkT4gbwO+FkJzqN3QmjCy+B0k95gk=;
 b=e4ERiFvcw7XN3S5cv3zBbhG1jD4JP6IJ/muxqlYGw0/fA0JXOh+wHA1C8eOKxfglf9Gnfs
 pTN8uZ50ICaqk8Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A4F413A7C;
 Tue, 26 Jul 2022 15:56:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wIzXCMMO4GJQYwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 26 Jul 2022 15:56:51 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 26 Jul 2022 17:56:45 +0200
Message-Id: <20220726155646.26468-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726155646.26468-1-pvorel@suse.cz>
References: <20220726155646.26468-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] tst_cgroup: Fix -Wstringop-truncation warning
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

QWRkIHNwYWNlIGZvciBudWxsIHRlcm1pbmF0b3IgdG8gZml4IHdhcm5pbmc6Cgp0c3RfY2dyb3Vw
LmM6NTA1OjE3OiB3YXJuaW5nOiDigJhfX2J1aWx0aW5fc3RybmNweeKAmSBvdXRwdXQgbWF5IGJl
IHRydW5jYXRlZCBjb3B5aW5nIDI1NSBieXRlcyBmcm9tIGEgc3RyaW5nIG9mIGxlbmd0aCAyNTUg
Wy1Xc3RyaW5nb3AtdHJ1bmNhdGlvbl0KICA1MDUgfCAgICAgICAgICAgICAgICAgc3RybmNweShj
Z3JvdXBfdGVzdF9kaXIsIHRlc3RfZGlyX25hbWUsIE5BTUVfTUFYKTsKICAgICAgfCAgICAgICAg
ICAgICAgICAgXgoKRml4ZXM6IGViZWJkZDczNSAoIkFQSS9jZ3JvdXA6IEltcGxlbWVudCB0c3Rf
Y2dfbG9hZF9jb25maWciKQoKU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2Uu
Y3o+Ci0tLQogbGliL3RzdF9jZ3JvdXAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi90c3RfY2dyb3VwLmMgYi9s
aWIvdHN0X2Nncm91cC5jCmluZGV4IDk5OGIyNTlhNi4uNmYyNGUwNDUwIDEwMDY0NAotLS0gYS9s
aWIvdHN0X2Nncm91cC5jCisrKyBiL2xpYi90c3RfY2dyb3VwLmMKQEAgLTUwMiw3ICs1MDIsNyBA
QCBzdGF0aWMgdm9pZCBjZ3JvdXBfcGFyc2VfY29uZmlnX2xpbmUoY29uc3QgY2hhciAqY29uc3Qg
Y29uZmlnX2VudHJ5KQogCX0KIAogCWlmICghcm9vdC0+dGVzdF9kaXIuZGlyX25hbWUgJiYgc3Ry
Y21wKHRlc3RfZGlyX25hbWUsICJOVUxMIikpIHsKLQkJc3RybmNweShjZ3JvdXBfdGVzdF9kaXIs
IHRlc3RfZGlyX25hbWUsIE5BTUVfTUFYKTsKKwkJc3RybmNweShjZ3JvdXBfdGVzdF9kaXIsIHRl
c3RfZGlyX25hbWUsIE5BTUVfTUFYICsgMSk7CiAJCWNncm91cF9kaXJfbWsoJnJvb3QtPmx0cF9k
aXIsIGNncm91cF90ZXN0X2RpciwgJnJvb3QtPnRlc3RfZGlyKTsKIAkJcm9vdC0+dGVzdF9kaXIu
d2VfY3JlYXRlZF9pdCA9IDE7CiAJfQotLSAKMi4zNy4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
