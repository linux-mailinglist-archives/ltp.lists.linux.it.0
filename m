Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89628B0DB
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Oct 2020 10:53:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DD923C2878
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Oct 2020 10:53:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6F3EE3C1C9E
 for <ltp@lists.linux.it>; Mon, 12 Oct 2020 10:53:29 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F0D9D6006D5
 for <ltp@lists.linux.it>; Mon, 12 Oct 2020 10:53:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B62BAFD5;
 Mon, 12 Oct 2020 08:53:28 +0000 (UTC)
Date: Mon, 12 Oct 2020 10:53:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201012085326.GA29137@dell5510>
References: <20201005133054.23587-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005133054.23587-1-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/11] Test metadata extraction
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> This patchset adds a test metadata extraction into LTP and also
> documentation generator that produces browseable HTML documentation from
> the exported metadata. For detailed description of the idea and
> implementation see the patch that adds README.md.

> While the idea is quite new the code is mature enough to be included in
> the upstream repository and I'm also worried that we will not get any
> feedback or users of the metadata unless it's included in the upstream
> git.

Example of the output:
(generally I prefer asciidoctor, but PDF support is not always available)
HTML could have custom javascript (probably jquery) based search/filtering.

= asciidoctor
* PDF
https://pevik.github.io/asciidoctor/metadata.pdf
There is missing TOC (as :toc: does not work and adding '-a toc' to generate as:
asciidoctor -d book metadata.txt -b pdf -r asciidoctor-pdf -a toc

puts TOC at the top.

* HTML single page
https://pevik.github.io/asciidoctor/metadata.html

= asciidoc
* PDF
https://pevik.github.io/asciidoc/metadata.pdf
There is ugly revision history at the top.

* HTML single page
https://pevik.github.io/asciidoc/metadata.html

* HTML chunked
https://pevik.github.io/asciidoc/metadata.chunked/index.html
https://pevik.github.io/asciidoc/metadata.chunked/ch01.html
https://pevik.github.io/asciidoc/metadata.chunked/ch02.html
https://pevik.github.io/asciidoc/metadata.chunked/ch03.html

> The next step is to use the extracted metadata in runltp-ng in the proof
> of concept parallel executor that has been written by Ritchie and posted
> to this mailing list as well.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
