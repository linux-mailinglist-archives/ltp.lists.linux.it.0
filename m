Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A053ACDBF9
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 08:53:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 208813C1C90
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 08:53:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0506F3C038C
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 08:53:30 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C3F241A00EE6
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 08:53:29 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id D61929F7FC;
 Mon,  7 Oct 2019 06:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570431208; bh=4oISBeQcjfxu/OxWpy3ej2oVgaq5esOjAorlMKu9JSY=;
 h=Subject:From:To:Message-ID:Date:MIME-Version;
 b=rpd29wmGCEHiaX0KJlYZeqEFeIyjlnHmHgUWU/jYlEDMRxcx4w58X+53+fW2myIDK
 CpQMffYy73WeczZU3Y6Rp5qgKbdFHXC2hbn8K5QYMMJ+7KE5sVg1cUscxBmOHgYcPR
 DLOKzOBhM/3ixiO+l1e6lRx0X0styc0hryZTC/Fk=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it, chrubis@suse.cz
References: <20191007064534.4364-1-lkml@jv-coder.de>
Message-ID: <31eb1229-ea59-3597-5502-dfd05a9ee234@jv-coder.de>
Date: Mon, 7 Oct 2019 08:53:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191007064534.4364-1-lkml@jv-coder.de>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] (no subject)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Added changes suggested by Cyril.
> BTW: The kernel is still tainted, even if the license is set, because
> of out-of-tree module:
>> ltp_lsmod01: loading out-of-tree module taints kernel.
Sorry, didn't meant to sent this...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
