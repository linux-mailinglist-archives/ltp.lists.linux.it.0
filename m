Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E37FD07B5
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:57:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 156FC3C134D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:57:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 6ECF43C0DFD
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:57:22 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EBB5A1000F31
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:55:55 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 229679F679;
 Wed,  9 Oct 2019 06:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570604241; bh=YTgdYD2fIMDeoWrFTnuwLStmCyp95Z31aPzllRMAH2k=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=ayYvzCZgAgtVDvTXa1KHTKxpzMCwgedfUvdfmMrO6eGpp+0gh1eFPeSUuTvEXaChO
 yQu7CIx42Lw9YkzX/CC0LeW3KrClqQPByQWm3qSo25ASrwDw44Kt9ooa7I45PJp74O
 myZcActlKuKQXjdsA+0KeUSnKD4P2kLdtpKEVGSE=
To: Petr Vorel <pvorel@suse.cz>
References: <20191009061619.48677-1-lkml@jv-coder.de>
 <20191009061619.48677-3-lkml@jv-coder.de> <20191009065225.GA27854@dell5510>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <fa4c146c-2916-2b65-449d-daf12838ce35@jv-coder.de>
Date: Wed, 9 Oct 2019 08:57:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191009065225.GA27854@dell5510>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] tst_test.sh: Add public tst_test_root command
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgoKPiBZb3UgbmVlZCB0byByZXBsYWNlIHMvX3RzdF9yZXF1aXJlX3Jvb3QvdHN0X3Rlc3Rf
cm9vdC8gaW4gb3RoZXIgbGlicmFyeSBmaWxlcwo+ICh0c3RfbmV0LnNoLCB0c3Rfc2VjdXJpdHku
c2gpLgpTb3JyeSwgZGlkIG5vdCBleHBlY3QgZnVuY3Rpb25zIHdpdGggXyB0byBiZSB1c2VkIGlu
IG90aGVyIGZpbGVzLgpJJ2xsIGNoZWNrIGl0IG5leHQgdGltZQoKSsO2cmcKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
