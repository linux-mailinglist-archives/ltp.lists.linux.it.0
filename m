Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A970D64724A
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Dec 2022 15:55:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1B983CC06B
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Dec 2022 15:55:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9FE9F3CC04C
 for <ltp@lists.linux.it>; Thu,  8 Dec 2022 15:55:30 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 99E9360091C
 for <ltp@lists.linux.it>; Thu,  8 Dec 2022 15:55:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE30E337A0;
 Thu,  8 Dec 2022 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1670511328;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlFFCTuFLNE36xkXfpWIpadxZ7rIyZuRrG09WzySL9o=;
 b=J1WntRJDED2J4vkPea5oSGzMXkCpcdV8GiAkIHg5qLDuB36gKP37XRyLIZcMsSGKGeKKUE
 DnRCLmH7ZjjCcqzihKhSjnhH5oIr5M1qVzz/5b8BUTQ9R2IV0CQxKtNfeuEn4WPprpZDIk
 OYEvg22A6I+eyWp9oUl59O0zRwbW3xw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1670511328;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlFFCTuFLNE36xkXfpWIpadxZ7rIyZuRrG09WzySL9o=;
 b=syR4zfEpCxC20eunaGyRP+yCNOIeqVt9a+H6jcxaS5HJzBKaLz8Uq9aUCllxAbFbX68e6f
 gICFc23O/IlyZ2AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA2B013416;
 Thu,  8 Dec 2022 14:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JPg1LOD6kWNcdwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 08 Dec 2022 14:55:28 +0000
Date: Thu, 8 Dec 2022 15:55:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Y5H63jzkq/P1hNf9@pevik>
References: <20221208130348.65693-1-zhaogongyi@huawei.com>
 <Y5Hlcc86GF56GY6f@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5Hlcc86GF56GY6f@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

PiBIaSEKPiA+IEFkZCBDRkxBR1MgLVduby1taXNzaW5nLWZpZWxkLWluaXRpYWxpemVycyB0byBz
dXBwcmVzcyB0aGUKPiA+IGNvbXBpbGF0aW9uIHdhcm5pbmdzIGxpa2U6Cgo+ID4gYXV0b2dyb3Vw
MDEuYzo4NzoxOiB3YXJuaW5nOiBtaXNzaW5nIGluaXRpYWxpemVyIGZvciBmaWVsZCDigJhuZWVk
c19jbWRz4oCZIG9mIOKAmHN0cnVjdCB0c3RfdGVzdOKAmSBbLVdtaXNzaW5nLWZpZWxkLWluaXRp
YWxpemVyc10KPiA+ICB9Owo+ID4gIF4KPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBhdXRvZ3Jv
dXAwMS5jOjIxOjA6Cj4gPiAuLi8uLi8uLi8uLi9pbmNsdWRlL3RzdF90ZXN0Lmg6MzI0OjIxOiBu
b3RlOiDigJhuZWVkc19jbWRz4oCZIGRlY2xhcmVkIGhlcmUKPiA+ICAgY29uc3QgY2hhciAqY29u
c3QgKm5lZWRzX2NtZHM7Cgo+IFRoaXMgaXMgYWN0dWFsbHkgY2F1c2VkIGJ5IGEgZ2NjIGJ1ZyB0
aGF0IGhhcyBiZWVuIGFscmVhZHkgZml4ZWQgc2VlOgoKPiBodHRwczovL2djYy5nbnUub3JnL2J1
Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD04NDY4NQoKPiBBbmQgSSBkbyBub3QgdGhpbmsgdGhhdCBp
dCdzIGEgZ29vZCBpZGVhIHRvIHdvcmsgYXJvdW5kIGdjYyB3YXJuaW5ncyBpbgo+IG91ciBidWls
ZCBzeXN0ZW0uCgpJIHdvdWxkIG5vdCB3b3JrYXJvdW5kIGl0IGVpdGhlci4KCktpbmQgcmVnYXJk
cywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
