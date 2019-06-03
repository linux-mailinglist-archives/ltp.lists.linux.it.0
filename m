Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E132929
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 09:12:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6CC0E2987A7
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 09:12:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 463C0294AC0
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 09:12:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A42E3600A64
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 09:12:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6356EAFEC;
 Mon,  3 Jun 2019 07:12:34 +0000 (UTC)
Date: Mon, 3 Jun 2019 09:12:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190603071236.GA14710@dell5510>
References: <CAOQ4uxhYVDDh961PCBqikrO=QjPG-yUEUvwWn8hBCkB0ugMuzg@mail.gmail.com>
 <20190530025301.9616-1-xzhou@redhat.com>
 <20190530025301.9616-2-xzhou@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530025301.9616-2-xzhou@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v6 2/2] OVL_MNT: setup overlayfs dirs and mount in
 a separated mountpoint
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

SGkgTXVycGh5LCBBbWlyLAoKbWVyZ2VkLCB3aXRoIHRpbnkgY2hhbmdlcyBpbiB0aGUgY29kZSBh
bmQgdXBkYXRlZCBjb21taXQgbWVzc2FnZS4KVGhhbmsgeW91IGJvdGggZm9yIGEgdmVyeSBuaWNl
IGNvbGxhYm9yYXRpb24uCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
