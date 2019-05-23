Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4D727F14
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 16:06:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84FC73EA786
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 16:06:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 062413EA1E0
 for <ltp@lists.linux.it>; Thu, 23 May 2019 16:06:16 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E5F5660CB93
 for <ltp@lists.linux.it>; Thu, 23 May 2019 16:06:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CAA555857F;
 Thu, 23 May 2019 14:06:13 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FBC7600C1;
 Thu, 23 May 2019 14:06:12 +0000 (UTC)
Date: Thu, 23 May 2019 22:06:11 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190523140611.apl55g3qdu4lyyjh@XZHOUW.usersys.redhat.com>
References: <CAOQ4uxjDyx7JFBSmkDe-rHNe=NriT710Ldsva=s+HasaDL0CTw@mail.gmail.com>
 <20190510044217.5215-1-xzhou@redhat.com>
 <CAOQ4uxi1=Xj59GvyrJf9HiMgGvRYTC8HGG8UOZKz3B8zgGh52g@mail.gmail.com>
 <20190510081535.ax7th47uyjjkayk6@XZHOUW.usersys.redhat.com>
 <CAOQ4uxjAzTL+aN4SdvD7xEUhuOht0nc70JDUOqAHGoyChOyPbA@mail.gmail.com>
 <20190511042014.xlonuwqpg6owg6a3@XZHOUW.usersys.redhat.com>
 <CAOQ4uxjQ918iCXv3XdzmyKfQjqzBu-=N3Y+-BXDmrEDH-KVfpQ@mail.gmail.com>
 <20190513073935.t6pbbvzqlflc42do@XZHOUW.usersys.redhat.com>
 <20190523135518.GF30616@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523135518.GF30616@rei.lan>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 23 May 2019 14:06:13 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: Li Wang <liwan@redhat.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/swap{on,
 off}: fail softly if FIBMAP ioctl trial fails
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpJJ20gd29ya2luZyBvbiBhIG5ldyB2ZXJzaW9uIGJhc2VkIG9uIEFtaXIncyBjb21tZW50
cy4gV2lsbCBwb3N0IGxhdGVyLiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbiA6KQoKTXVycGh5CgpP
biBUaHUsIE1heSAyMywgMjAxOSBhdCAwMzo1NToxOFBNICswMjAwLCBDeXJpbCBIcnViaXMgd3Jv
dGU6Cj4gSGkhCj4gR3V5cyB3aGF0IHNob3VsZCBJIG1lcmdlIGluIHRoZSBlbmQ/Cj4gCj4gTG9v
a2luZyBhdCB0aGUgY29udmVyc2F0aW9uIHY0IHdhcyBub3QgZmluYWwgcGF0Y2gsIG9yIHdhcyBp
dD8KPiAKPiAtLSAKPiBDeXJpbCBIcnViaXMKPiBjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
