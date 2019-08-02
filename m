Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E9C7FC8A
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 16:50:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81C553C202C
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 16:50:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A99043C200A
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 16:50:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0750D602122
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 16:50:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CEE69AF38
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 14:50:14 +0000 (UTC)
Date: Fri, 2 Aug 2019 16:50:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20190802145014.GD17684@rei>
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-2-chrubis@suse.cz>
 <1879623564.3992300.1564655982672.JavaMail.zimbra@redhat.com>
 <87a7crd606.fsf@rpws.prws.suse.cz> <20190802135944.GA17684@rei>
 <877e7vd489.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877e7vd489.fsf@rpws.prws.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/9] lib: Add support for guarded buffers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> If we have runtime free then we need to figure out which map the
> >> address belongs to or what its offset is (if any).
> >
> > That's easy, we will store the returned pointer to the map structure
> > and use it for comparsion...
> 
> So that free() is an O(n) operation where n is the number of maps or you
> will use a hash map to make it O(1)?

I doubt that we will ever allocate more than a few buffers, so it's
perfectly fine that way. Also if you keep allocating and freeing buffer
in a loop it would be at the start of the list, so it would be O(1) as
well.

The only patological case would be allocating thousands of buffers and
then freeing them in a reversed order, which would be O(n^2).

Other options would be storing the pointer to the map before the buffer,
just as malloc does, but I doubt that we will ever need that.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
