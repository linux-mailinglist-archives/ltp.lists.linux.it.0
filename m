Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1505FAE4D
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Oct 2022 10:21:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 46A903CAEA4
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Oct 2022 10:21:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 562B93C3030
 for <ltp@lists.linux.it>; Tue, 11 Oct 2022 10:21:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0BC12200225
 for <ltp@lists.linux.it>; Tue, 11 Oct 2022 10:21:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0EE6D2224A;
 Tue, 11 Oct 2022 08:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665476461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zE/tPDb7qZXFqBlGwyVJIFUyAB9OMUxogFU/tZlrhEA=;
 b=D0r5uknl8gGi2WKyb2x2IxdRciYWsLhw7drdM0c+CC2BjXDGoiYM9yLyv7a9XLJkQUpOAw
 hq7vIrnu4Ta9+YfplIcwLX5wp0ZIge91ajHihyr25rhohBDUjfOMRjhLa3CjPrdzMspWpa
 T6EtNd3mmzF6N+XuMHncIx8eTp7dJdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665476461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zE/tPDb7qZXFqBlGwyVJIFUyAB9OMUxogFU/tZlrhEA=;
 b=W4BYz5n0U/0hZ99ha84cI/eKKEpMSS0RoaOV3o2JqffNMoBFn5w6k2mxrbH/ki5vo3kZZT
 rmEpWTvciccG52Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5AB6139ED;
 Tue, 11 Oct 2022 08:21:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9tqtNmwnRWNlIgAAMHmgww
 (envelope-from <nstange@suse.de>); Tue, 11 Oct 2022 08:21:00 +0000
From: Nicolai Stange <nstange@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
References: <20221010152754.6109-1-mdoucha@suse.cz>
Date: Tue, 11 Oct 2022 10:21:00 +0200
In-Reply-To: <20221010152754.6109-1-mdoucha@suse.cz> (Martin Doucha's message
 of "Mon, 10 Oct 2022 17:27:54 +0200")
Message-ID: <87h70azs7n.fsf@linux.fritz.box>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kvm: Fix init array symbol names
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

SGkgTWFydGluLAoKTWFydGluIERvdWNoYSA8bWRvdWNoYUBzdXNlLmN6PiB3cml0ZXM6Cgo+IEds
aWJjIGV4cGVjdHMgX19pbml0X2FycmF5X3N0YXJ0IHN5bWJvbCBpbnN0ZWFkIG9mIF9faW5pdF9h
cnJheV9iZWdpbiwKPiBvdGhlcndpc2UgdGhlIEtWTSBsaW5rZXIgc2NyaXB0IGNoZWNrIGluIGNv
bmZpZ3VyZSB3aWxsIGZhaWwgb24gc29tZQo+IExpbnV4IGRpc3RyaWJ1dGlvbnMuIENoYW5nZSB0
aGUgc3ltYm9sIG5hbWUgdG8gZml4IHRoZSBpc3N1ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcnRp
biBEb3VjaGEgPG1kb3VjaGFAc3VzZS5jej4KCmxvb2tzIGdvb2QgdG8gbWUsIGZlZWwgZnJlZSB0
byBhZGQKCiAgUmV2aWV3ZWQtYnk6IE5pY29sYWkgU3RhbmdlIDxuc3RhbmdlQHN1c2UuZGU+CgpU
aGFua3MhCgpOaWNvbGFpCgotLSAKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
LCBGcmFua2Vuc3RyYcOfZSAxNDYsIDkwNDYxIE7DvHJuYmVyZywgR2VybWFueQpHRjogSXZvIFRv
dGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
