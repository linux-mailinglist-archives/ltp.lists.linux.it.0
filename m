Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D53FC270
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 08:14:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1C613C2AE0
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 08:14:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B88C33C1DFA
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 08:14:10 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CD9DA1400B90
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 08:14:09 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E335C2214E;
 Tue, 31 Aug 2021 06:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630390448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fB2gMQOfFcNi4tKhgeBXoSf9okiIO9KOeAotXaDwueA=;
 b=GkmznkQNHRyEwXw2JVhNRRtgOXVkuzzMo4kpL5L4u7IeSPIToDOTyD2uymxUev+YmFFhdc
 EvrUUhfGgmzQlGg59Oi2zFUUQEYzs+M0zTKvJGDeMg+bpBrwTHiISy17u2upeo0t0QlUxE
 4XMiX7MnpYro0tTcI/orpQAht/Z/sz0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630390448;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fB2gMQOfFcNi4tKhgeBXoSf9okiIO9KOeAotXaDwueA=;
 b=mGm83qEG/j3YdtOYxdVlbIhxA0+Zgmd8zqaJ4Q4NILEg2pNaasfjArwWggHhuJ85DShU5C
 g0FY9bj+6/gXCNBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EF85E13299;
 Tue, 31 Aug 2021 06:14:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id OsE9Nq/ILWGHOQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 31 Aug 2021 06:14:07 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 31 Aug 2021 08:13:55 +0200
Message-Id: <20210831061355.15533-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] scripts: Remove detect_distro.sh, git2changelog.sh
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Remove other 11 years old unused scripts:

* detect_distro.sh: there is lsb-release
* git2changelog.sh we don't generate changelog from git

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 scripts/detect_distro.sh | 127 ---------------------------------------
 scripts/git2changelog.sh |  28 ---------
 2 files changed, 155 deletions(-)
 delete mode 100755 scripts/detect_distro.sh
 delete mode 100755 scripts/git2changelog.sh

diff --git a/scripts/detect_distro.sh b/scripts/detect_distro.sh
deleted file mode 100755
index df9d927e9..000000000
--- a/scripts/detect_distro.sh
+++ /dev/null
@@ -1,127 +0,0 @@
-#!/bin/sh
-#
-#	Answer the question: what distro are we installing.
-#
-#    Copyright (C) 2010, Cisco Systems Inc.
-#
-#    This program is free software; you can redistribute it and/or modify
-#    it under the terms of the GNU General Public License as published by
-#    the Free Software Foundation; either version 2 of the License, or
-#    (at your option) any later version.
-#
-#    This program is distributed in the hope that it will be useful,
-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-#    GNU General Public License for more details.
-#
-#    You should have received a copy of the GNU General Public License along
-#    with this program; if not, write to the Free Software Foundation, Inc.,
-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Ngie Cooper, January 2010
-#
-#
-
-error() {
-	echo "${0##*/}: ERROR: $*" >&2
-}
-
-destdir=
-omit_redhat_minor_version=0
-
-while getopts "d:m" opt; do
-
-	case "$opt" in
-	d)
-		if [ ! -d "$OPTARG" ] ; then
-			error "$OPTARG doesn't exist"
-			exit 1
-		fi
-		destdir=$OPTARG
-		;;
-	m)
-		omit_redhat_minor_version=1
-		;;
-	esac
-done
-
-etc_dir="$destdir/etc"
-
-if [ ! -d "$etc_dir" ] ; then
-	error "$etc_dir doesn't exist"
-	exit 1
-fi
-
-#
-# Precedence list for files to look through for version info...
-#
-# XXX (garrcoop): add more..
-#
-for i in gentoo-release redhat-release; do
-	if [ -f "$etc_dir/$i" ] ; then
-		DISTRO_RELEASE_FILE="$i"
-		break
-	fi
-done
-
-if [ "x$DISTRO_RELEASE_FILE" = x ] ; then
-	error "Couldn't determine distro release file"
-	error "Please send an email with your distro's details, if you believe this is in error"
-	exit 1
-else
-	DISTRO_RELEASE_ABS_FILE="$etc_dir/$DISTRO_RELEASE_FILE"
-
-	case "$i" in
-	gentoo-release)
-		DISTRO=gentoo
-		RELEASE_FORMAT_FILE=1
-		;;
-	redhat-release)
-		RELEASE_FORMAT_FILE=1
-		if grep -q '^Red Hat' "$DISTRO_RELEASE_ABS_FILE"; then
-			DISTRO=redhat
-		elif grep -q '^Fedora' "$DISTRO_RELEASE_ABS_FILE"; then
-			DISTRO=fedora
-		else
-			RELEASE_FORMAT_FILE=0
-		fi
-		;;
-	esac
-
-	if [ $RELEASE_FORMAT_FILE -eq 1 ] ; then
-
-		set -- $(cat "$DISTRO_RELEASE_ABS_FILE")
-
-		while [ 1 ] ; do
-			shift
-			if [ $# -eq 0 -o "x$1" = "xrelease" ] ; then
-				if [ "x$1" = "xrelease" ] ; then
-					shift
-				fi
-				break
-			fi
-		done
-
-		case "$DISTRO" in
-		gentoo)
-			VERSION=$1
-			;;
-		fedora|redhat)
-			MAJOR_VER=$1
-			if [ $omit_redhat_minor_version -eq 0 ] && echo "$@" | grep -q '\(.*Update.*\)'; then
-				MINOR_VER=$(echo "$@" | sed -e 's/[\(\)]//g' -e 's/.*Update //')
-			fi
-			VERSION="$MAJOR_VER${MINOR_VER:+.${MINOR_VER}}"
-			;;
-		esac
-
-	fi
-
-	if [ "x$VERSION" = x ] ; then
-		error "Bad release file: $etc_dir/$DISTRO_RELEASE_FILE"
-		exit 2
-	else
-		echo "$DISTRO-$VERSION"
-	fi
-
-fi
diff --git a/scripts/git2changelog.sh b/scripts/git2changelog.sh
deleted file mode 100755
index 0ff37b29a..000000000
--- a/scripts/git2changelog.sh
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/bin/sh
-#
-# Dumb script for making a ChangeLog.
-#
-# Invoke like:
-#
-# scripts/git2changelog.sh --after="2010-02-01" --until="2010-02-31"
-#
-
-set -e
-
-tmp_changelog=$(mktemp /tmp/changelog.XXXXXX)
-
-trap "[ -f '$tmp_changelog' ] && rm -f '$tmp_changelog'; [ -f '$changelog~' ] && mv '$changelog~' '$changelog'" 0 2 15
-
-changelog="${0%/*}/../ChangeLog"
-
-git log --format="%nCommit: %H%nDate:   %aD%n%n%s%n%b%nChanged Files:" \
-	--name-only "$@" > "$tmp_changelog"
-
-cat "$changelog" >> "$tmp_changelog"
-
-mv "$changelog" "$changelog~"
-
-# This may take a while...
-mv "$tmp_changelog" "$changelog"
-
-rm -f "$changelog~"
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
