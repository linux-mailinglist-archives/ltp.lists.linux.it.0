Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCEE23BD8
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 17:18:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48A102987AA
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 17:18:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 109663EA2E0
 for <ltp@lists.linux.it>; Mon, 20 May 2019 17:18:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EACA6600695
 for <ltp@lists.linux.it>; Mon, 20 May 2019 17:18:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3D417B006
 for <ltp@lists.linux.it>; Mon, 20 May 2019 15:18:28 +0000 (UTC)
Date: Mon, 20 May 2019 17:18:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190520151826.GA10350@dell5510>
References: <20190520135450.22014-1-pvorel@suse.cz>
 <20190520141940.GB28976@rei.lan> <20190520145002.GA28760@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520145002.GA28760@dell5510>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] lib: Migrate tst_get_unused_port to new API
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpQdXNoZWQgd2l0aCBmb2xsb3dpbmcgZGlmZjoKPiAtCXJldHVybiBUU1RfR0VUX1VOVVNF
RF9QT1JUKGZhbWlseSwgdHlwZSk7Cj4gKwlwcmludGYoIiVkIiwgVFNUX0dFVF9VTlVTRURfUE9S
VChmYW1pbHksIHR5cGUpKTsKPiArCXJldHVybiAwOwo+ICB9CgpLaW5kIHJlZ2FyZHMsClBldHIK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
