Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A122DAA8C
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Dec 2020 11:02:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39A2D3C2EFF
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Dec 2020 11:02:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 903B03C24E3
 for <ltp@lists.linux.it>; Tue, 15 Dec 2020 11:01:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F32B81000234
 for <ltp@lists.linux.it>; Tue, 15 Dec 2020 11:01:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26734ACC6
 for <ltp@lists.linux.it>; Tue, 15 Dec 2020 10:01:56 +0000 (UTC)
Date: Tue, 15 Dec 2020 11:01:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <X9iJkj3ZDWj2NaWi@pevik>
References: <X9iGKllfr8qYi/yX@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9iGKllfr8qYi/yX@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Travis fix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi,

> you may noticed that our Travis CI testing currently fails on Ubuntu eoan.

> This is because Travis has outdated docker image, which still expect
> eoan-security being on ttp://security.ubuntu.com/ubuntu.

> I'm testing other releases, groovy should be probably best option (LTS => used
> by many people and has security repository so we don't have to bother fixing apt
> repository).
OK, 20.04 LTS focal in Travis is still fails on debconf issue [3]
("debconf: unable to initialize frontend: Dialog") which expect user input.
20.10 groovy is not LTS, but it looks stable. Let's move to it (we'll need to
switch to something else in 7 months, or we can move to another distro).

Kind regards,
Petr

[3] https://travis-ci.org/github/pevik/ltp/jobs/749784860
[4] https://travis-ci.org/github/pevik/ltp/jobs/749784861

> I suppose I fix it during today.

> Travis got pretty slow last few weeks. Maybe it's related to the move from
> travis-ci.org to travis-ci.com. Maybe we should think about other CI if problem
> persists for months. It looks like GitHub Actions supports docker [1].
> Also Gitlab pipelines support it [2], but moving from GitHub would affect more
> things than just CI.

> Kind regards,
> Petr

> [1] https://docs.github.com/en/free-pro-team@latest/actions/creating-actions/creating-a-docker-container-action
> [2] https://docs.gitlab.com/ee/ci/docker/using_docker_images.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
