-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msabjvotpqgybymtyfljcwrvzrtnyhucxdav` (`ownerId`),
  CONSTRAINT `fk_dgkblzmegosoxlwxryjtdbhkrbfohigwbycg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_msabjvotpqgybymtyfljcwrvzrtnyhucxdav` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xvvdvfltlnmumqdrujwfrufypghpvyecfqib` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_wdonjwcjmusuiwvoxjfeqvnrnftiabwwhpnv` (`dateRead`),
  KEY `fk_mjbhbneargqbsylhjpocmgyrwhahsqucbfih` (`pluginId`),
  CONSTRAINT `fk_mjbhbneargqbsylhjpocmgyrwhahsqucbfih` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wgystrdsayywzgkmcnfxcpzowtnxzbmtqkmu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pzstlrhsipfnhohqpmuiepofdzqiebfnuncm` (`sessionId`,`volumeId`),
  KEY `idx_lqzzfwwrxltemchtrojiagufiswghhycocoj` (`volumeId`),
  CONSTRAINT `fk_busfusgyqfapgbutswdeaoxhseomjesubbtz` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkcwcinyyeqedaerwgyzcsklkawphwzwicvx` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jfpmfprwdynjfcunafmabpkexubpvfnmnyxy` (`filename`,`folderId`),
  KEY `idx_tvmpndkodcjapkihljtxnjyazlyrcalysmwx` (`folderId`),
  KEY `idx_mienudqugtqiatgcegjyzvfzxdmpjnexdrmz` (`volumeId`),
  KEY `fk_hcfugtsjvppjnfwaiurnyechkavucrofubtu` (`uploaderId`),
  CONSTRAINT `fk_hcfugtsjvppjnfwaiurnyechkavucrofubtu` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mvxjsllultcijerclhfbisuyaundnkhuilkh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_odvvmufxpihhnilsjhhmgxtxyzobzjewkkqs` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pzxrsrqaciuhoselhftuwfnacvgvodqfuema` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_umkydtzwqczqfzkhykuxxdybdsjgvtwytrbz` (`groupId`),
  KEY `fk_xzyemizxpqidqfmpbgcurdmzovcatfetfdib` (`parentId`),
  CONSTRAINT `fk_dvocndwjriwdpuvynroefopaprhuumpxvcce` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qfeynhqczqrlzyyaupujzwgiervohcqtpmtv` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xzyemizxpqidqfmpbgcurdmzovcatfetfdib` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bflpiuvhghruvcreinfpllgxkxrvbqgygcft` (`name`),
  KEY `idx_hwuoqmxtvkdbtxbbxoxksdtktbvtgobdebkd` (`handle`),
  KEY `idx_nxchuvfdzdsttmbzsqjofdzerhdiswingrkz` (`structureId`),
  KEY `idx_rdswxtefqkshrajrkijnrmmvdvdsumsbvpth` (`fieldLayoutId`),
  KEY `idx_wsouzqewrpejdecuulacewimvjumwdlvwype` (`dateDeleted`),
  CONSTRAINT `fk_dljxktjrqlxtasizqkgeftonbzhysiezdaly` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fggpwcpbqluxdafddjhcvuokriaghmbbrlom` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tinjymvugtldpeuewopukgxffauzydjyblck` (`groupId`,`siteId`),
  KEY `idx_dmmpzkhwbkheqtumvvapnzksgtmgikbdovnn` (`siteId`),
  CONSTRAINT `fk_ayrpclmevzovlbvsphacezpmkytwiqviqbnx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fqtxalxicwkumjcxhrqmcgsubipzxqjzhcyu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_iuqqziobcmsnzimuaveaoxcnzjjhktqdvloc` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_zboeazmaubtyfisfnodtttbdlmtnnxrqggna` (`siteId`),
  KEY `fk_djtbtnstxblwgqynusjgvjxkudsiqviiospk` (`userId`),
  CONSTRAINT `fk_djtbtnstxblwgqynusjgvjxkudsiqviiospk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_qjgnmqqxtwqxpiyeavhtxpdtqcmebtqmhkph` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zboeazmaubtyfisfnodtttbdlmtnnxrqggna` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_dhspaagrufjcydckwfjpupecdgxzgswmfhfj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_szmtdyzyzinmftywoguuovnrttiebtkredej` (`siteId`),
  KEY `fk_stuuzhstyyxgufqmcngnjsmzsyhlvromjxce` (`fieldId`),
  KEY `fk_nzvwouufkpbrzqhtlszzywtapoekcudlyoej` (`userId`),
  CONSTRAINT `fk_nzvwouufkpbrzqhtlszzywtapoekcudlyoej` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ovpgrlcyyuimieptsacalrorxuyqkkpcbpds` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stuuzhstyyxgufqmcngnjsmzsyhlvromjxce` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_szmtdyzyzinmftywoguuovnrttiebtkredej` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jqzcffcvmftihrofdryftwugozjhktgjmowf` (`elementId`,`siteId`),
  KEY `idx_bgwnufnpfnfbmgdoqopioxdnmcrqpzcvkwit` (`siteId`),
  KEY `idx_rgrowoyqhhhtdbdzruigjzffxuavqtqeicid` (`title`),
  CONSTRAINT `fk_bqomwnmcsbqexhsrvlxcibreijzftpuhlrwp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsvqkvgigqgvjhiyogqkkwjkwxlflzzdyigl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ektfcaaepmlvdscierryrdgxgddoporfluft` (`userId`),
  CONSTRAINT `fk_ektfcaaepmlvdscierryrdgxgddoporfluft` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(5) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ddtccbzofpndlamlrocvhoyicjxclrhjjjek` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_curwyhpvadatseawdryxhqsouklhgpvtqnfi` (`creatorId`,`provisional`),
  KEY `idx_jhjrorhssqwigiibsgvnsiymxkimnrxbkumo` (`saved`),
  KEY `fk_yoelqncjxhgfnsrreqjbmokgqugoonamzdnf` (`canonicalId`),
  CONSTRAINT `fk_sjxysysjhyppvvzfngazzyeqfcttdshgqiqq` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yoelqncjxhgfnsrreqjbmokgqugoonamzdnf` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gtsmheywkesqhdkgspsqleecvbxoumglircg` (`dateDeleted`),
  KEY `idx_qqgybcxnkbajppipzkfxbbilqzkpzmtrpcpg` (`fieldLayoutId`),
  KEY `idx_wjvxofnyicpedlomeeqmpzuiporthduxtxdi` (`type`),
  KEY `idx_ienjfaqmhnpboqvjugxatypbrdpxajteugzg` (`enabled`),
  KEY `idx_votqatyhpfdkjgiyvocmwsmjoyaohehsnthz` (`archived`,`dateCreated`),
  KEY `idx_wanficubtvzuuwqjzrbmlgrjqhxvvjdicmzh` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_eaeeimfsfcmdzcpsurjpmnscmrurjlqjosus` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_hkvlwkjxtlrrayypwrumgozetdfvzzynnhpq` (`canonicalId`),
  KEY `fk_bsfildfwwphnwammekzzdnxpyfoyzkdzsgrr` (`draftId`),
  KEY `fk_gbdzoypkeufspxygkegkwzocvqlncyungygg` (`revisionId`),
  CONSTRAINT `fk_bsfildfwwphnwammekzzdnxpyfoyzkdzsgrr` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gbdzoypkeufspxygkegkwzocvqlncyungygg` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hkvlwkjxtlrrayypwrumgozetdfvzzynnhpq` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tqmyrnrvxyvveunghayaxxnnadifrtysefpa` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hpdxtxcgefsyyatmwjnyuklkvaaxpwoekzpu` (`elementId`,`siteId`),
  KEY `idx_laiqjnniceelttilnnmjchqmynrtvcbuoaru` (`siteId`),
  KEY `idx_ofoxjbdnrsznxhyfdqpszhkxfqzhaarilody` (`slug`,`siteId`),
  KEY `idx_hnpltzcivigosragveapcznpacjdnedgdael` (`enabled`),
  KEY `idx_nynrfguuklmzqfbwqwwsghcqxcnztyybgeyy` (`uri`,`siteId`),
  CONSTRAINT `fk_kgzyxygnsnnvtdontfcthscuzxkjjxnebjpd` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qbtgabvbfiktiiswakthdhzsiiqgfxifcnsz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xbickxurytkhgbvsmyyvtxucfuueirdzqwev` (`postDate`),
  KEY `idx_urgqcomvjoruhyqecdmvczaizptdofxvkjra` (`expiryDate`),
  KEY `idx_loaufgdtfreoiblimqomupdyomfyhbecvfiq` (`authorId`),
  KEY `idx_eswztppsffqczyvvmzmxwwlzhqazdhuorkkb` (`sectionId`),
  KEY `idx_dmnsedghyviooycajhveibfuhjvwcxzlhhan` (`typeId`),
  KEY `fk_kbqvdhfkhqqunwmrsyvdomeqhxiekgepigis` (`parentId`),
  CONSTRAINT `fk_kbqvdhfkhqqunwmrsyvdomeqhxiekgepigis` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_oqbgakgfpwimmujvqytlrbyolrdgjqqnzprb` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pbhovcuuxyporbardqfedhsqjtccipcyfecx` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ttaloxtlzsdjqefkakhtdckcjydfvyojpdkf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrviuyajjrrumhwtlmrupgyxggqgmihusnlj` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oudlojczyyxeofdquysqhmrqtbcguianwbgp` (`name`,`sectionId`),
  KEY `idx_ofttkwjsjyuqzjltvdelrmqsccvluddguqno` (`handle`,`sectionId`),
  KEY `idx_eojzyjlmxeqywwzqbgiezqsxztzezvtdtazy` (`sectionId`),
  KEY `idx_rfnpufswriackxsbmehadyvwkbwpqztynkbt` (`fieldLayoutId`),
  KEY `idx_mktvketumtcfmvsufzibrsbamqcokdjnshwd` (`dateDeleted`),
  CONSTRAINT `fk_kbkxbyifnvxxtozcdugycwntwtsfaveqlhpm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xkpcldfuthhwfjeeqwtrezmfugsluibqdkaw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_imwqoeblxzxjxivvckhfwkwcnsxjdotrikkc` (`name`),
  KEY `idx_vdcawaezccybhftaiexnzcmuiuzehobqssga` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oujiwocvtwlxvnnadigozpuzqfrttylfdvew` (`layoutId`,`fieldId`),
  KEY `idx_usjbmsttnddzmcavmvzbuvlklbonlvwdzzlv` (`sortOrder`),
  KEY `idx_nidridlbfdcgpxvbdxrvwvdlsdknccpvzsmk` (`tabId`),
  KEY `idx_nutysbxdxxbeglaqcicnfkbcyqebxbmmsicw` (`fieldId`),
  CONSTRAINT `fk_kwtwxstkeeplxystqsbbeumynqzsssoiuvwn` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tqnxdvvhqykxjybbkvlxtiukwtdgvrvdpvgp` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydzjxxjrpkirghprbozltqtpyqpwrlkrjugj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_diixgfqdmrosirhncdxttjktqinuxabytsoa` (`dateDeleted`),
  KEY `idx_nbnbcrppsgzsqjkfcygumjtlsksygcxxgstk` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cgkrrpqvmuoewjgqikegegristhxdbrhnewm` (`sortOrder`),
  KEY `idx_pbnymoydnfsldjrpdqjvrhnonrycbfvqmxki` (`layoutId`),
  CONSTRAINT `fk_xfzilykajymmmdpezfvsdsbibikjsbpgjccv` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fjdwjydzxmgplyksgdfxccirnvqgqaxgkasz` (`handle`,`context`),
  KEY `idx_pxfrqqmdebjfjvarhcqhitilfnntpedtyphw` (`groupId`),
  KEY `idx_qdsbjuwemznsysnbpaqsloajrcwlrxoouyya` (`context`),
  CONSTRAINT `fk_ukoeadgflxsllkzthlrwrrtlmvhyanydwfts` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lcegtfuoeqylravucwcqolvzztzpwhzwkrhv` (`name`),
  KEY `idx_phaeisfusfvhzurupuhpcqfoywmrwxwfzdvm` (`handle`),
  KEY `idx_yxplscnjrapyeasnamuqvnajceococalfyui` (`fieldLayoutId`),
  KEY `idx_wjhhkehfapvepuusdkhjryttjoxsotaklmjr` (`sortOrder`),
  CONSTRAINT `fk_bpfauhmvzvafveapnlylgnogzacgbxyrtzgf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tjrgoubhfyuxzuhwqjbzmcphcaspluikfumi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qrxtttpguhgnmowubepwsccsiqognurhfuhr` (`accessToken`),
  UNIQUE KEY `idx_zftdlfvqbkhwmqlyrlxnhkifoutvbzlmksvt` (`name`),
  KEY `fk_pgdydkmejezpzfmkqplzymxsifvbqwhwvehm` (`schemaId`),
  CONSTRAINT `fk_pgdydkmejezpzfmkqplzymxsifvbqwhwvehm` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uozubtaczjmgounkzceydubgqxxjnhaoyqnq` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cvdoxggyqrozydzeilnvgsuiatwvezozieyp` (`name`),
  KEY `idx_bzlvvtwfxynqnfexgxxiinznucmauvhvjmxr` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lcgheyvlqbhhwdhxbozsfvnemndrohoahtja` (`primaryOwnerId`),
  KEY `idx_nbpjmalrzrbjuzjtonoecwqndcwhepsqrnsd` (`fieldId`),
  KEY `idx_knftlksklxxyswwjyglzjvfiebpmvmmehvbg` (`typeId`),
  CONSTRAINT `fk_fdvtfplkxpusezvohijyjeqxnxwntfukdxww` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mowckeoaqvlsdtxtkiitenhmnlgupxrsbofh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uayurabdnscdjvhbgfkypzgxsjheoixzgrxj` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wrvhzxvrgjxzwdezcmyshpjkwmxufrenmoqe` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_onshdkkpjryjzfcghhycgploqtmrupqpfvav` (`ownerId`),
  CONSTRAINT `fk_bewwjjxrtsezdkyleeahtnldlbbnerytnmpq` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_onshdkkpjryjzfcghhycgploqtmrupqpfvav` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ypqcbdqoueybauqqgivxasjizlaajshrheml` (`name`,`fieldId`),
  KEY `idx_ncfyenrlxvwemlaheyusretnvazovhneptrt` (`handle`,`fieldId`),
  KEY `idx_dstofwgtxnehqhjieskqvdcnmangfnanmidk` (`fieldId`),
  KEY `idx_qfvowxlwvjfnkuwazckwgpyzyypwzrdpfzei` (`fieldLayoutId`),
  CONSTRAINT `fk_bomyvchgsezdenucronkkluqjrivoyrxepwu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zbgnefgehceamrzgssdckvsqkoyejhkjpqxp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bwoitonatyluxwuitjyzgmluoqgbxasjjiup` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vuvauqxvdcciosbzvehxvnrpqngasulvjdkd` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(10) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vcfkfdoxramrhqstyzfvlihfaupnsjkluxtm` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_uadakxmkzghrhcwiqlwvkcvejhvynyrgfvng` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_drobnvyajkynrbmkcooulabxcgghisdfxqow` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_crfnrsbokqcfjhfuifkwqmzkbblcaqiitirk` (`sourceId`),
  KEY `idx_casvyjipwiklphiwkocfuoyutkrmnebfayqj` (`targetId`),
  KEY `idx_buvzdxtoecztgmopusmrxqwgawbsjtiswflw` (`sourceSiteId`),
  CONSTRAINT `fk_byupggysxlkdqilhuciaazbiwgddmgjwftnp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ggdrstfcnfvbtglryujhhkfihkqvlytdnldq` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ipycaijurbitmtrpacupumcnahxwqplzlwbd` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rpsotpuindomtnqizjqaowgjvdwultqaodrl` (`canonicalId`,`num`),
  KEY `fk_xcgsnamhhxxfcdfihibvnmsfwlxmxwxizsia` (`creatorId`),
  CONSTRAINT `fk_ncsbvlhkikkkrypibqljgwamlwyzasjercbk` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xcgsnamhhxxfcdfihibvnmsfwlxmxwxizsia` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_qtifyfqpijgdbmwkkqerfpydggonvzyjdwuz` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vhzcobpdvxyrqrbrxwxclvsokayjnywincer` (`handle`),
  KEY `idx_ounocdtuxabltgkaqcitdandwyeoctzqpznt` (`name`),
  KEY `idx_mdcyhvxpudpcovusxxpbncqkfxjcerlfawod` (`structureId`),
  KEY `idx_avfauefjfcnxaayllprbomskbcfdnvmfnlkr` (`dateDeleted`),
  CONSTRAINT `fk_iixudohwzsevkmsesdtcfatdqllnnyomhlrc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ugkanpqmretdbjbrjszptmbzpsqcujiyezzc` (`sectionId`,`siteId`),
  KEY `idx_ewbibexjibphcsjzgltkfzejpjirastnqksf` (`siteId`),
  CONSTRAINT `fk_swpuvuduilgpgrofyncxvllvqlyhplsjdrdw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ysymocxxldspfetuukxbjsgnnletszmhiqah` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eoyjeqebjijvhysehazhglswvysnifxckzul` (`uid`),
  KEY `idx_foztuwjzdwrtrbsbygfiybjgjgauytnjkacq` (`token`),
  KEY `idx_yazneqmwxikhavqobhucihwgnflrdncmudzi` (`dateUpdated`),
  KEY `idx_oeujcbvyujkxarpuqhrldhvybvgkdiubxgys` (`userId`),
  CONSTRAINT `fk_tuhyhbgxqqomovzsxwiabcuitncpnjaxbcnf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gxmssnflplycfojhardquudwaaetzrteitnn` (`userId`,`message`),
  CONSTRAINT `fk_ocksebcmxnuruqdjxydsahnntfuuhfiewegm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ohkqjkhxdxmrbhpwxxwyrlvniducxqkdnldd` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zqcmgnlmbzvpnavqpwneqdjynhvexbyvbexj` (`dateDeleted`),
  KEY `idx_glaqmdscmayinzbkqwskyqdtqiwqoncnggxf` (`handle`),
  KEY `idx_qevogplhncnlkfadbelqjwrzuqhujdibrdwv` (`sortOrder`),
  KEY `fk_tovfslllqdwlapmlncjxigccikdudlzwqbuy` (`groupId`),
  CONSTRAINT `fk_tovfslllqdwlapmlncjxigccikdudlzwqbuy` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sprig_playgrounds`
--

DROP TABLE IF EXISTS `sprig_playgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sprig_playgrounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `component` text DEFAULT NULL,
  `variables` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(10) unsigned DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rgt` int(10) unsigned NOT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_acfxgvxjezglpilxdzkdheapyprjfkjpymzl` (`structureId`,`elementId`),
  KEY `idx_lqjmynzqkpfrdegwxvztqxdktqcsnrijogle` (`root`),
  KEY `idx_gtudhyaetwugfayjydzmowtdoklwkhmofxmv` (`lft`),
  KEY `idx_irdskieztirzdrspwebajbzftsbhokqhaerg` (`rgt`),
  KEY `idx_fcvhhbptaksrarpxhzblxugwciksaffnstph` (`level`),
  KEY `idx_qpcpkqlyjkeppalkzkvkresvylvfhusbrbgo` (`elementId`),
  CONSTRAINT `fk_pazvrrxkmmjfahwynrgetqhdpgddznysvbcw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zjyeakmqzcpfeivjaglxozperqulhqvumzry` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ucevqojawzwborkwvjwgsfcybbykorkzfzcx` (`key`,`language`),
  KEY `idx_yqurubbtmynqbgvfyhsltiilbxraaxtdhrfg` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pbzdufsswnridwsvcvvvwpqhrtarjqqrqeom` (`name`),
  KEY `idx_cigkbgpemwaiqmejjqqozrzoslqwijwmffxf` (`handle`),
  KEY `idx_lyrdtdfnogxxfpyvqmeghabtrpyjshzrhbyb` (`dateDeleted`),
  KEY `fk_zzzfmeaiovlpglzisnmnjdeqopmfjzbczadf` (`fieldLayoutId`),
  CONSTRAINT `fk_zzzfmeaiovlpglzisnmnjdeqopmfjzbczadf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qmxiwsskrpdhpehpwzavuqcouswjiqyveuiz` (`groupId`),
  CONSTRAINT `fk_bsncminnekinqvfhsuwyyuvoyasewbujixca` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rnuixgjlpkrtdhlcsztvfsuvzwxwjebribcy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ksjayqxjenllhvsrcijcqekllpaainfelnwr` (`token`),
  KEY `idx_xydvfzqpqjmjctcjljgvrzudtnkgjccuvrks` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oultxuqmrshfzkzeuvvfvzdtveebjsowvryt` (`handle`),
  KEY `idx_mnnejlifgwmksnurjzbmgaxasgwmtvukywty` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_txjpzwbdjjzejwutikmelanmcadawlswpvqm` (`groupId`,`userId`),
  KEY `idx_vriahrctfketywjhulmjvbmqxmmnigdcmcoy` (`userId`),
  CONSTRAINT `fk_bjauwyoxqbxevscsolngtfdimvpqxxmcuqoz` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_epjzskxcguxtmqwdnmclbuseazcotshkhzbj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ahzokmcpdjljbtvgnmnevbgybztsdjbblirv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ixxxcatmboxsnkkjcmwicmpoaxhrtltfrqix` (`permissionId`,`groupId`),
  KEY `idx_xruyntxcskjslgrtzklebpzncwaxhpksfsra` (`groupId`),
  CONSTRAINT `fk_goxzzzrupxuxzidhbpmtxnehrryqosmldvme` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mucwcdryxhvbjbmqpieghmtjpkpfcxuqmcmn` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kxetwhtoyvzesvjaqgfdyjpcnocntrdcolbs` (`permissionId`,`userId`),
  KEY `idx_kvloffvvabhsevkikqlzsjsrhrdzqhfsfyzu` (`userId`),
  CONSTRAINT `fk_qszjwuhobqeoofodprzptiawnwmyegdfekbg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wtfacjjfkksjallznpcnwmugbemqwrqemszv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_dgqmxwihecruwjvulfajoaeyyeuzrqydzknb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_whhtlqdnasojfotsjgsfwhofwcrirrgebanq` (`active`),
  KEY `idx_vgjuuupdgvtxrchpvsfvutkwjchbyunkrpcm` (`locked`),
  KEY `idx_wslzawuwnkyiyoeusjzvhsjdqjshgkljgxfm` (`pending`),
  KEY `idx_qkimepwgickvaodroivqsftwbrylagnurcvp` (`suspended`),
  KEY `idx_ecyodzggbcbsxdjibjnxrckhiranlyhgcpft` (`verificationCode`),
  KEY `idx_duwcweslgdatyfwttebcrlzmvwtjihhknulv` (`email`),
  KEY `idx_wpcuagwrelorgdodrnbtzrhuxpsydxpxutbf` (`username`),
  KEY `fk_oekxohrklnsghmpspsxpvswjkzomcyhcgaer` (`photoId`),
  CONSTRAINT `fk_mjvmslgeiurroqcfnfqfktgoyszidvphnmta` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oekxohrklnsghmpspsxpvswjkzomcyhcgaer` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bgzmvocibypmwkbudogieakwqmyydxvykkuk` (`name`,`parentId`,`volumeId`),
  KEY `idx_junmbourfkiquxjjwgsrjndrqwjbztinxzge` (`parentId`),
  KEY `idx_xxxbgiaowddczjqxaxqrrucolfqwzshbqpnw` (`volumeId`),
  CONSTRAINT `fk_knuxmiriggkdroxikcalkngkhrbyfuyfrcmi` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nocbtbjnheegqsrefgqgvwnujwjuyoiwzomp` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tlfgayhaklkmadwyfhdmwppzrsplwkcoxlps` (`name`),
  KEY `idx_djldeizejicpbskculrwdfdylbevirlytlhg` (`handle`),
  KEY `idx_emvorgbvupdlscomjgtydgktupvuxgirruah` (`fieldLayoutId`),
  KEY `idx_asyqynflyuuxvsgaskmtnljcevfmwayiummn` (`dateDeleted`),
  CONSTRAINT `fk_mufrazjnhecngzahobbcjttwchrfejajdaxd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(5) unsigned DEFAULT NULL,
  `colspan` tinyint(4) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qmprcbxpsoeusvovcspkwubvkrrbcjaohwbq` (`userId`),
  CONSTRAINT `fk_yetzzdnkpczkkuuskiervpkwvhkqovoembzi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-07 17:54:32
-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (39,1,1,1,'bacalar-1.jpg','image',NULL,4000,3000,1589422,NULL,NULL,NULL,'2023-05-06 22:15:54','2023-05-06 22:15:55','2023-05-06 22:15:55'),(40,1,1,1,'bacalar-2.jpg','image',NULL,4000,3000,1602033,NULL,NULL,NULL,'2023-05-06 22:15:55','2023-05-06 22:15:56','2023-05-06 22:15:56'),(41,1,1,1,'bacalar-3.jpg','image',NULL,4032,3024,924798,NULL,NULL,NULL,'2023-05-06 22:15:56','2023-05-06 22:15:57','2023-05-06 22:15:57'),(42,1,1,1,'bacalar-1_2023-05-06-221621_nyvf.jpg','image',NULL,4000,3000,1586260,NULL,0,0,'2023-05-06 22:16:21','2023-05-06 22:16:21','2023-05-06 22:16:21'),(43,1,1,1,'bacalar-2_2023-05-06-221622_ksen.jpg','image',NULL,4000,3000,1598871,NULL,0,0,'2023-05-06 22:16:22','2023-05-06 22:16:22','2023-05-06 22:16:23'),(45,1,1,1,'bacalar-3_2023-05-06-221636_lvvh.jpg','image',NULL,4032,3024,921636,NULL,0,0,'2023-05-06 22:16:36','2023-05-06 22:16:36','2023-05-06 22:16:36'),(53,1,1,1,'chichen-itza-1.jpg','image',NULL,3000,2008,884250,NULL,NULL,NULL,'2023-05-06 23:19:21','2023-05-06 23:19:21','2023-05-06 23:19:21'),(54,1,1,1,'chichen-itza-2.jpg','image',NULL,2765,1843,756669,NULL,NULL,NULL,'2023-05-06 23:19:21','2023-05-06 23:19:21','2023-05-06 23:19:21'),(55,1,1,1,'chichen-itza-3.jpg','image',NULL,2000,1333,522265,NULL,NULL,NULL,'2023-05-06 23:19:21','2023-05-06 23:19:22','2023-05-06 23:19:22'),(62,1,1,1,'uvita-1.jpg','image',NULL,2000,1125,228061,NULL,NULL,NULL,'2023-05-07 00:29:06','2023-05-07 00:29:06','2023-05-07 00:29:06'),(63,1,1,1,'uvita-2.jpg','image',NULL,2000,1125,330593,NULL,NULL,NULL,'2023-05-07 00:29:07','2023-05-07 00:29:07','2023-05-07 00:29:07'),(64,1,1,1,'uvita-3.jpg','image',NULL,2000,1333,308061,NULL,NULL,NULL,'2023-05-07 00:29:07','2023-05-07 00:29:07','2023-05-07 00:29:07'),(67,1,1,1,'rio-de-janeiro-3.jpg','image',NULL,2000,1253,410229,NULL,NULL,NULL,'2023-05-07 01:13:56','2023-05-07 01:13:56','2023-05-07 01:13:56'),(68,1,1,1,'rio-de-janeiro-1.jpg','image',NULL,2000,1333,605132,NULL,NULL,NULL,'2023-05-07 01:13:56','2023-05-07 01:13:57','2023-05-07 01:13:57'),(69,1,1,1,'rio-de-janeiro-2.jpg','image',NULL,2000,1368,446126,NULL,NULL,NULL,'2023-05-07 01:13:57','2023-05-07 01:13:57','2023-05-07 01:13:57'),(74,1,1,1,'barcelona-1.jpg','image',NULL,2000,1333,439126,NULL,NULL,NULL,'2023-05-07 14:15:31','2023-05-07 14:15:31','2023-05-07 14:15:31'),(75,1,1,1,'barcelona-2.jpg','image',NULL,2000,1333,532321,NULL,NULL,NULL,'2023-05-07 14:15:32','2023-05-07 14:15:32','2023-05-07 14:15:32'),(76,1,1,1,'barcelona-3.jpg','image',NULL,1200,800,346406,NULL,NULL,NULL,'2023-05-07 14:15:32','2023-05-07 14:15:32','2023-05-07 14:15:32'),(79,1,1,1,'london-2.jpg','image',NULL,1600,1067,172806,NULL,NULL,NULL,'2023-05-07 14:17:52','2023-05-07 14:17:53','2023-05-07 14:17:53'),(80,1,1,1,'london-1.jpg','image',NULL,1600,1067,410840,NULL,NULL,NULL,'2023-05-07 14:17:53','2023-05-07 14:17:53','2023-05-07 14:17:53'),(81,1,1,1,'london-3.jpg','image',NULL,1600,1067,487660,NULL,NULL,NULL,'2023-05-07 14:17:53','2023-05-07 14:17:53','2023-05-07 14:17:53'),(84,1,1,1,'the-burren.jpg','image',NULL,1600,1067,289516,NULL,NULL,NULL,'2023-05-07 14:20:53','2023-05-07 14:20:53','2023-05-07 14:20:53'),(89,1,1,1,'austria.jpg','image',NULL,1600,900,289427,NULL,NULL,NULL,'2023-05-07 14:23:11','2023-05-07 14:23:11','2023-05-07 14:23:11'),(94,1,1,1,'lofoten.jpg','image',NULL,1600,996,396003,NULL,NULL,NULL,'2023-05-07 14:24:57','2023-05-07 14:24:57','2023-05-07 14:24:57'),(103,1,1,1,'tokyo.jpg','image',NULL,1600,1067,334055,NULL,NULL,NULL,'2023-05-07 14:28:04','2023-05-07 14:28:04','2023-05-07 14:28:04'),(106,1,1,1,'petra.jpg','image',NULL,1600,1200,632017,NULL,NULL,NULL,'2023-05-07 14:29:34','2023-05-07 14:29:34','2023-05-07 14:29:34'),(109,1,1,1,'kings-canyon.jpg','image',NULL,1600,1067,370786,NULL,NULL,NULL,'2023-05-07 14:31:32','2023-05-07 14:31:32','2023-05-07 14:31:32');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'email','2023-05-07 01:24:06',0,1),(1,1,'fieldLayoutId','2023-05-06 23:24:07',0,1),(1,1,'fullName','2023-05-07 01:22:46',0,1),(2,1,'postDate','2023-05-06 22:16:30',0,1),(2,1,'slug','2023-05-06 22:14:39',0,1),(2,1,'title','2023-05-06 22:14:39',0,1),(3,1,'postDate','2023-05-06 22:09:41',0,1),(3,1,'slug','2023-05-06 22:09:41',0,1),(3,1,'title','2023-05-06 22:09:41',0,1),(5,1,'postDate','2023-05-06 22:09:49',0,1),(5,1,'slug','2023-05-06 22:09:49',0,1),(5,1,'title','2023-05-06 22:09:49',0,1),(7,1,'postDate','2023-05-06 22:09:54',0,1),(7,1,'slug','2023-05-06 22:09:54',0,1),(7,1,'title','2023-05-06 22:09:54',0,1),(9,1,'postDate','2023-05-06 22:09:59',0,1),(9,1,'slug','2023-05-06 22:09:59',0,1),(9,1,'title','2023-05-06 22:09:59',0,1),(11,1,'postDate','2023-05-06 22:10:04',0,1),(11,1,'slug','2023-05-06 22:10:04',0,1),(11,1,'title','2023-05-06 22:10:04',0,1),(13,1,'postDate','2023-05-06 22:10:11',0,1),(13,1,'slug','2023-05-06 22:10:11',0,1),(13,1,'title','2023-05-06 22:10:11',0,1),(15,1,'postDate','2023-05-06 22:10:15',0,1),(15,1,'slug','2023-05-06 22:10:15',0,1),(15,1,'title','2023-05-06 22:10:15',0,1),(17,1,'postDate','2023-05-06 22:10:31',0,1),(17,1,'slug','2023-05-06 22:10:31',0,1),(17,1,'title','2023-05-06 22:10:20',0,1),(19,1,'postDate','2023-05-06 22:10:36',0,1),(19,1,'slug','2023-05-06 22:10:36',0,1),(19,1,'title','2023-05-06 22:10:36',0,1),(21,1,'postDate','2023-05-06 22:10:41',0,1),(21,1,'slug','2023-05-06 22:10:41',0,1),(21,1,'title','2023-05-06 22:10:41',0,1),(23,1,'postDate','2023-05-06 22:10:47',0,1),(23,1,'slug','2023-05-06 22:10:47',0,1),(23,1,'title','2023-05-06 22:10:47',0,1),(25,1,'slug','2023-05-06 22:11:39',0,1),(25,1,'title','2023-05-06 22:11:39',0,1),(27,1,'postDate','2023-05-06 22:11:18',0,1),(27,1,'slug','2023-05-06 22:11:18',0,1),(27,1,'title','2023-05-06 22:11:18',0,1),(31,1,'postDate','2023-05-06 22:15:01',0,1),(31,1,'slug','2023-05-06 22:15:13',0,1),(31,1,'title','2023-05-06 22:15:13',0,1),(35,1,'postDate','2023-05-06 22:15:27',0,1),(35,1,'slug','2023-05-06 22:15:27',0,1),(35,1,'title','2023-05-06 22:15:27',0,1),(37,1,'postDate','2023-05-06 22:15:34',0,1),(37,1,'slug','2023-05-06 22:15:34',0,1),(37,1,'title','2023-05-06 22:15:34',0,1),(48,1,'postDate','2023-05-06 23:19:30',0,1),(48,1,'slug','2023-05-06 23:20:37',0,1),(48,1,'title','2023-05-06 23:20:37',0,1),(49,1,'postDate','2023-05-06 23:16:33',0,1),(49,1,'slug','2023-05-06 23:16:33',0,1),(49,1,'title','2023-05-06 23:16:32',0,1),(51,1,'postDate','2023-05-06 23:16:38',0,1),(51,1,'slug','2023-05-06 23:16:38',0,1),(51,1,'title','2023-05-06 23:16:38',0,1),(61,1,'postDate','2023-05-07 00:29:15',0,1),(61,1,'slug','2023-05-07 00:28:36',0,1),(61,1,'title','2023-05-07 00:28:36',0,1),(66,1,'postDate','2023-05-07 01:14:04',0,1),(66,1,'slug','2023-05-07 14:07:41',0,1),(66,1,'title','2023-05-07 14:07:41',0,1),(73,1,'postDate','2023-05-07 14:15:39',0,1),(73,1,'slug','2023-05-07 14:13:03',0,1),(73,1,'title','2023-05-07 14:13:03',0,1),(78,1,'postDate','2023-05-07 14:17:58',0,1),(78,1,'slug','2023-05-07 14:16:22',0,1),(78,1,'title','2023-05-07 14:16:22',0,1),(83,1,'postDate','2023-05-07 14:20:55',0,1),(83,1,'slug','2023-05-07 14:20:14',0,1),(83,1,'title','2023-05-07 14:20:18',0,1),(88,1,'postDate','2023-05-07 14:23:13',0,1),(88,1,'slug','2023-05-07 14:22:24',0,1),(88,1,'title','2023-05-07 14:22:24',0,1),(91,1,'postDate','2023-05-07 14:24:59',0,1),(91,1,'slug','2023-05-07 14:24:08',0,1),(91,1,'title','2023-05-07 14:24:08',0,1),(92,1,'postDate','2023-05-07 14:24:26',0,1),(92,1,'slug','2023-05-07 14:24:26',0,1),(92,1,'title','2023-05-07 14:24:25',0,1),(102,1,'postDate','2023-05-07 14:28:06',0,1),(102,1,'slug','2023-05-07 14:27:23',0,1),(102,1,'title','2023-05-07 14:27:23',0,1),(105,1,'postDate','2023-05-07 14:29:36',0,1),(105,1,'slug','2023-05-07 14:29:17',0,1),(105,1,'title','2023-05-07 14:29:17',0,1),(108,1,'postDate','2023-05-07 14:31:34',0,1),(108,1,'slug','2023-05-07 14:30:53',0,1),(108,1,'title','2023-05-07 14:30:53',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,1,'2023-05-06 23:19:55',0,1),(2,1,2,'2023-05-06 22:15:44',0,1),(48,1,1,'2023-05-06 23:19:27',0,1),(48,1,2,'2023-05-06 23:16:55',0,1),(61,1,1,'2023-05-07 00:29:13',0,1),(61,1,2,'2023-05-07 00:28:54',0,1),(66,1,1,'2023-05-07 01:14:01',0,1),(66,1,2,'2023-05-07 14:25:29',0,1),(73,1,1,'2023-05-07 14:15:36',0,1),(73,1,2,'2023-05-07 14:25:18',0,1),(78,1,1,'2023-05-07 14:17:56',0,1),(78,1,2,'2023-05-07 14:16:41',0,1),(83,1,1,'2023-05-07 14:20:54',0,1),(83,1,2,'2023-05-07 14:25:11',0,1),(88,1,1,'2023-05-07 14:23:12',0,1),(88,1,2,'2023-05-07 14:22:40',0,1),(91,1,1,'2023-05-07 14:24:57',0,1),(91,1,2,'2023-05-07 14:24:31',0,1),(102,1,1,'2023-05-07 14:28:05',0,1),(102,1,2,'2023-05-07 14:27:33',0,1),(105,1,1,'2023-05-07 14:29:35',0,1),(105,1,2,'2023-05-07 14:29:26',0,1),(108,1,1,'2023-05-07 14:31:33',0,1),(108,1,2,'2023-05-07 14:31:07',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-02-02 05:28:23','2023-05-07 01:25:16','e5f6e318-4d9f-4ce0-9c87-be98e1bd6559'),(2,2,1,'Bacalar Lagoon, Mexico','2023-05-06 22:06:23','2023-05-06 23:19:55','3d916fc3-572a-473e-b90b-8fa37db03858'),(3,3,1,'Mountains','2023-05-06 22:09:37','2023-05-06 22:09:41','c26c0928-56d9-434b-859c-4c2d726abf22'),(4,4,1,'Mountains','2023-05-06 22:09:41','2023-05-06 22:09:41','3132c94f-c573-4da6-9ab0-d3c58e83244b'),(5,5,1,'Jungle','2023-05-06 22:09:43','2023-05-06 22:09:49','f4dece90-c68d-43f3-a7a2-80322fa9e1e1'),(6,6,1,'Jungle','2023-05-06 22:09:49','2023-05-06 22:09:49','75d0648e-8d12-4dea-813a-148f80c0c9d8'),(7,7,1,'Forest','2023-05-06 22:09:51','2023-05-06 22:09:54','d17cd373-d53b-4e12-aad7-a03794b25a1b'),(8,8,1,'Forest','2023-05-06 22:09:54','2023-05-06 22:09:54','e2c74449-6de3-4b07-bffa-a0c0dfa733cb'),(9,9,1,'Lake','2023-05-06 22:09:56','2023-05-06 22:09:59','cbfee6b2-1ab1-4c94-8732-0ceec054aa40'),(10,10,1,'Lake','2023-05-06 22:09:59','2023-05-06 22:09:59','87aa9bb8-db4f-4127-ad25-08bea8c06370'),(11,11,1,'River','2023-05-06 22:10:01','2023-05-06 22:10:04','1db68e89-e8f8-40fe-a525-8294f6bbf06d'),(12,12,1,'River','2023-05-06 22:10:04','2023-05-06 22:10:04','1ab38aec-110b-49be-990d-7df0df8e4edf'),(13,13,1,'Countryside','2023-05-06 22:10:07','2023-05-06 22:10:11','ac4c8623-c96e-4bd9-a65a-3f273db25e44'),(14,14,1,'Countryside','2023-05-06 22:10:11','2023-05-06 22:10:11','9e4d1271-3a7b-47f5-a5b5-a787e87c2673'),(15,15,1,'City','2023-05-06 22:10:12','2023-05-06 22:10:15','6982ca10-5b56-406b-a738-77cf04548368'),(16,16,1,'City','2023-05-06 22:10:15','2023-05-06 22:10:15','3594c8cc-be52-436d-bbfb-fded4c82702c'),(17,17,1,'Nightlife','2023-05-06 22:10:16','2023-05-06 22:10:31','0609be2f-28fa-4f56-8100-1bc633b3fd1c'),(18,18,1,'Nightlife','2023-05-06 22:10:31','2023-05-06 22:10:31','dd585780-9926-4238-b900-03b80c9f1e62'),(19,19,1,'Beach','2023-05-06 22:10:32','2023-05-06 22:10:36','43c4606a-0bd9-4b6d-99d8-20ba41cdd09a'),(20,20,1,'Beach','2023-05-06 22:10:36','2023-05-06 22:10:36','1a845ced-1a26-4c23-8da3-145fc73ed6ea'),(21,21,1,'Party','2023-05-06 22:10:38','2023-05-06 22:10:41','313a83f7-d8f8-4e9c-9d41-84223e599462'),(22,22,1,'Party','2023-05-06 22:10:41','2023-05-06 22:10:41','f30307aa-414a-4ba1-94b5-0bef99910fba'),(23,23,1,'Retreat','2023-05-06 22:10:43','2023-05-06 22:10:47','b74ae794-9160-47f6-90a6-410d2f891992'),(24,24,1,'Retreat','2023-05-06 22:10:47','2023-05-06 22:10:47','b48e32f7-ace2-40b1-b6ac-0d831f1b03c6'),(25,25,1,'Outdoor Activities','2023-05-06 22:11:00','2023-05-06 22:11:39','0f49ed14-1b8e-4a88-95fb-1e6241bf7d18'),(26,26,1,'Hiking','2023-05-06 22:11:10','2023-05-06 22:11:10','f8ff258c-4698-4ee7-bd5b-180d9e6d14b1'),(27,27,1,'Extreme Sports','2023-05-06 22:11:12','2023-05-06 22:11:18','70ee12d9-fc2c-4d53-9faf-194006b4d085'),(28,28,1,'Extreme Sports','2023-05-06 22:11:18','2023-05-06 22:11:18','aee46594-c163-4248-9663-835180efc905'),(30,30,1,'Outdoor Activities','2023-05-06 22:11:39','2023-05-06 22:11:39','f5deb77f-0a15-4444-aea0-3119e4d80e53'),(31,31,1,'Water Sports','2023-05-06 22:14:55','2023-05-06 22:15:13','dbc0a47f-6f1e-4a0d-861c-54916efe340b'),(32,32,1,'Water Sprots','2023-05-06 22:15:01','2023-05-06 22:15:01','586c879d-1605-47dd-9aaa-dd5f1dfe48c6'),(34,34,1,'Water Sports','2023-05-06 22:15:13','2023-05-06 22:15:13','ce1f9597-8f62-4793-87e3-eea844eb9cdc'),(35,35,1,'Desert','2023-05-06 22:15:22','2023-05-06 22:15:27','57c83cdb-f1da-4e55-b765-eae542b61c74'),(36,36,1,'Desert','2023-05-06 22:15:27','2023-05-06 22:15:27','60edff6a-60ea-4daa-a2b7-a339a4d327fc'),(37,37,1,'Tropical','2023-05-06 22:15:29','2023-05-06 22:15:34','d1194391-b69c-494d-a114-9586a57afe90'),(38,38,1,'Tropical','2023-05-06 22:15:34','2023-05-06 22:15:34','caca34d2-e343-4d49-8c03-2f764e5a1dab'),(39,39,1,'Bacalar 1','2023-05-06 22:15:53','2023-05-06 22:15:53','5567a4c3-64b2-4c2f-a0d7-06d79e53df18'),(40,40,1,'Bacalar 2','2023-05-06 22:15:55','2023-05-06 22:15:55','ceb835a2-e88c-4670-ab95-6fe1dd8edc32'),(41,41,1,'Bacalar 3','2023-05-06 22:15:56','2023-05-06 22:15:56','832a6bde-2b37-40c3-9b6a-573364284f5d'),(42,42,1,'Bacalar 1','2023-05-06 22:16:20','2023-05-06 22:16:21','9e957601-33c9-4e8a-a2df-ca7b315a6f79'),(43,43,1,'Bacalar 2','2023-05-06 22:16:21','2023-05-06 22:16:22','9c462e57-383c-4298-920b-7f8528973d9d'),(44,44,1,'Bacalar Lagoon, Mexico','2023-05-06 22:16:30','2023-05-06 22:16:30','1fbae01f-72c9-477f-855b-c108bd3c9cb9'),(45,45,1,'Bacalar 3','2023-05-06 22:16:35','2023-05-06 22:16:36','4a68fa72-84fd-4167-a70b-dd6da0482ac7'),(47,47,1,'Bacalar Lagoon, Mexico','2023-05-06 22:16:41','2023-05-06 22:16:41','aa71eecb-d86a-4dbb-85ac-e9dc6ea4f1af'),(48,48,1,'Chichén Itzá, Mexico','2023-05-06 23:15:49','2023-05-06 23:20:37','3f410032-cdce-4658-b576-0e80abc2835b'),(49,49,1,'Ruins','2023-05-06 23:16:27','2023-05-06 23:16:33','6320168e-7eba-4f84-b4d6-597eeb95176a'),(50,50,1,'Ruins','2023-05-06 23:16:33','2023-05-06 23:16:33','9225120d-a1fc-4593-95c2-7b59c919f0ce'),(51,51,1,'Historic','2023-05-06 23:16:34','2023-05-06 23:16:38','d66ad80b-4671-4d1d-8e42-37d52dfcf744'),(52,52,1,'Historic','2023-05-06 23:16:38','2023-05-06 23:16:38','9a4f80b3-676a-406a-aaca-29474bc9a947'),(53,53,1,'Chichen itza 1','2023-05-06 23:19:20','2023-05-06 23:19:20','5ebf2961-b4ae-4574-bb2d-4eb5745fa07d'),(54,54,1,'Chichen itza 2','2023-05-06 23:19:21','2023-05-06 23:19:21','3eb3b0c8-7351-4aad-972a-547ca3a96cd3'),(55,55,1,'Chichen itza 3','2023-05-06 23:19:21','2023-05-06 23:19:21','8a2b54a9-c9c3-4399-9c10-4c25faaf3d3d'),(56,56,1,'Chichén Itzá','2023-05-06 23:19:30','2023-05-06 23:19:30','51795daf-9667-4e3f-9024-78b846322f3a'),(58,58,1,'Bacalar Lagoon, Mexico','2023-05-06 23:19:55','2023-05-06 23:19:55','9e988c70-b03a-413d-8e99-f2434781e1c7'),(60,60,1,'Chichén Itzá, Mexico','2023-05-06 23:20:37','2023-05-06 23:20:37','8b9df434-9d62-4561-9409-b59c533ade2a'),(61,61,1,'Uvita, Costa Rica','2023-05-07 00:28:24','2023-05-07 00:29:15','b02f27dd-232a-4802-bd10-577f0f8d77ce'),(62,62,1,'Uvita 1','2023-05-07 00:29:06','2023-05-07 00:29:06','fd845c8e-61a7-4384-96fe-3ffada761341'),(63,63,1,'Uvita 2','2023-05-07 00:29:07','2023-05-07 00:29:07','cb2086e1-696b-42df-89eb-f8a6bc071fbf'),(64,64,1,'Uvita 3','2023-05-07 00:29:07','2023-05-07 00:29:07','2ea07c81-a116-4f77-8abf-3b079f1a0420'),(65,65,1,'Uvita, Costa Rica','2023-05-07 00:29:15','2023-05-07 00:29:15','cdf58eff-42e8-4c0e-a77d-d79a0e192290'),(66,66,1,'Rio de Janeiro, Brazil','2023-05-07 01:13:22','2023-05-07 14:25:29','5280b0d2-d9a7-4199-bc1f-47963c922c8e'),(67,67,1,'Rio de janeiro 3','2023-05-07 01:13:56','2023-05-07 01:13:56','5c20951e-6c88-4eb6-8824-0e53058a18e4'),(68,68,1,'Rio de janeiro 1','2023-05-07 01:13:56','2023-05-07 01:13:56','58c6d467-30de-43be-9e35-435d0ad9459f'),(69,69,1,'Rio de janeiro 2','2023-05-07 01:13:57','2023-05-07 01:13:57','ed55a96c-b1b4-4787-8d65-214bbce0f900'),(70,70,1,'Rio de Janeiro','2023-05-07 01:14:04','2023-05-07 01:14:04','b044ff6d-3665-4533-800d-a2fce9a5ebc1'),(72,72,1,'Rio de Janeiro, Brazil','2023-05-07 14:07:41','2023-05-07 14:07:41','ffacfcd4-24ef-4e1b-891e-b223dddeba6f'),(73,73,1,'Barcelona, Spain','2023-05-07 14:12:47','2023-05-07 14:25:18','97a4d3d9-e36f-4bcc-be64-8031722d6f57'),(74,74,1,'Barcelona 1','2023-05-07 14:15:31','2023-05-07 14:15:31','46d2cff9-fe55-4ecb-9909-9c111abea20b'),(75,75,1,'Barcelona 2','2023-05-07 14:15:31','2023-05-07 14:15:31','dfd3b40e-3ae8-4953-a140-d37f9ea24abd'),(76,76,1,'Barcelona 3','2023-05-07 14:15:32','2023-05-07 14:15:32','dad181c2-a9ed-422d-9e43-3e21fb07dc62'),(77,77,1,'Barcelona, Spain','2023-05-07 14:15:39','2023-05-07 14:15:39','d2571720-3fe1-4c46-abdb-9b6c9a85b14b'),(78,78,1,'London, United Kingdom','2023-05-07 14:16:15','2023-05-07 14:17:58','2b7e2a0b-d5c5-471c-87f5-190b4ce1467b'),(79,79,1,'London 2','2023-05-07 14:17:52','2023-05-07 14:17:52','493ab68c-8558-4352-9c95-432c6ff4bd8a'),(80,80,1,'London 1','2023-05-07 14:17:53','2023-05-07 14:17:53','fbf0a281-f103-4a4f-af8a-f8f58be41cca'),(81,81,1,'London 3','2023-05-07 14:17:53','2023-05-07 14:17:53','639c75dc-cc46-429d-98e1-f35c74b023d5'),(82,82,1,'London, United Kingdom','2023-05-07 14:17:58','2023-05-07 14:17:58','21389da2-a20e-425b-ab30-7fb4c63ade16'),(83,83,1,'The Burren, Ireland','2023-05-07 14:20:07','2023-05-07 14:25:11','c34ea719-a3f8-4925-af2f-a6c541290399'),(84,84,1,'The burren','2023-05-07 14:20:53','2023-05-07 14:20:53','d623ef39-fcca-40a5-b9c1-9d6466a3ddc7'),(85,85,1,'The Burren, Ireland','2023-05-07 14:20:55','2023-05-07 14:20:55','2e8e2a2e-317e-47bd-b88b-d32487bb4245'),(87,87,1,'The Burren, Ireland','2023-05-07 14:21:22','2023-05-07 14:21:22','0fbf73b0-3a69-42d5-ab54-a5665afd5f3b'),(88,88,1,'Sankt Gilgen, Austria','2023-05-07 14:22:23','2023-05-07 14:23:13','67b549be-7e04-4634-a6c8-2231743820e5'),(89,89,1,'Austria','2023-05-07 14:23:10','2023-05-07 14:23:11','0eb3347d-8da3-4be4-a99b-c1c3ee61237c'),(90,90,1,'Sankt Gilgen, Austria','2023-05-07 14:23:13','2023-05-07 14:23:13','df84e639-69f6-404b-8c35-51e9547b1a6d'),(91,91,1,'Lofoten, Norway','2023-05-07 14:24:04','2023-05-07 14:24:59','a18796b9-aa81-4765-ad13-4c3dd1de5253'),(92,92,1,'Sea','2023-05-07 14:24:22','2023-05-07 14:24:26','faff97e9-9d66-46b1-a293-8b61b744b778'),(93,93,1,'Sea','2023-05-07 14:24:26','2023-05-07 14:24:26','c04c8b00-6d67-426d-ab1d-85b4a0299b60'),(94,94,1,'Lofoten','2023-05-07 14:24:56','2023-05-07 14:24:57','e315e285-3b54-4bf1-af2c-f280d55aa4aa'),(95,95,1,'Lofoten, Norway','2023-05-07 14:24:59','2023-05-07 14:24:59','0dc2b65c-f7c2-4808-a2e3-21e494b2d3f3'),(97,97,1,'The Burren, Ireland','2023-05-07 14:25:11','2023-05-07 14:25:11','eb78e1cc-ca81-4cdc-a21c-fb9b1256cb7f'),(99,99,1,'Barcelona, Spain','2023-05-07 14:25:18','2023-05-07 14:25:18','e0cefdd6-2439-49e8-8b78-cfa0b3348880'),(101,101,1,'Rio de Janeiro, Brazil','2023-05-07 14:25:29','2023-05-07 14:25:29','bf5ea9fc-9f1d-48a1-8022-100b280d97c4'),(102,102,1,'Tokyo, Japan','2023-05-07 14:26:26','2023-05-07 14:28:06','d0ff42ab-3f12-4ccc-ab22-4549bd4b0e83'),(103,103,1,'Tokyo','2023-05-07 14:28:04','2023-05-07 14:28:04','b42cc5c7-c3a0-40fe-a881-83e01fe3b288'),(104,104,1,'Tokyo, Japan','2023-05-07 14:28:06','2023-05-07 14:28:06','4ae74656-209f-4c18-ac63-d63458c822b9'),(105,105,1,'Petra, Jordan','2023-05-07 14:29:14','2023-05-07 14:29:36','c12df6ca-9323-42ca-86e5-b29a79cb3ea9'),(106,106,1,'Petra','2023-05-07 14:29:34','2023-05-07 14:29:34','0720dfed-a95b-4b12-ab39-ff293716787f'),(107,107,1,'Petra, Jordan','2023-05-07 14:29:36','2023-05-07 14:29:36','d8a42790-c604-4ac2-aa24-4e6d8946e9eb'),(108,108,1,'Kings Canyon, Australia','2023-05-07 14:30:50','2023-05-07 14:31:34','33a6c191-553e-4884-aa24-48c242d32ebc'),(109,109,1,'Kings canyon','2023-05-07 14:31:32','2023-05-07 14:31:32','9f7a23ab-a06d-43c4-8afd-b833191fb5e3'),(110,110,1,'Kings Canyon, Australia','2023-05-07 14:31:34','2023-05-07 14:31:34','f7dcd760-af57-450d-b366-27684c03bc58');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,4,'craft\\elements\\User',1,0,'2023-02-02 05:28:23','2023-05-07 01:25:16',NULL,NULL,'cdb3b2a1-cb8b-4271-bc6c-01ff3c34bcfd'),(2,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-06 22:06:23','2023-05-06 23:19:55',NULL,NULL,'2e0238c9-34d0-44bf-9b2f-e54826cdd50a'),(3,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:09:36','2023-05-06 22:09:41',NULL,NULL,'e2f54805-5359-4568-b189-a5518007aa84'),(4,3,NULL,1,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:09:41','2023-05-06 22:09:41',NULL,NULL,'fd6bce5a-921a-48e9-b92d-f963890b5c80'),(5,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:09:43','2023-05-06 22:09:49',NULL,NULL,'7f4029cc-922f-4e6f-b768-d0d061c3e0c3'),(6,5,NULL,2,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:09:49','2023-05-06 22:09:49',NULL,NULL,'268a96c8-43be-4085-ae1c-38581399df8a'),(7,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:09:51','2023-05-06 22:09:54',NULL,NULL,'b4f6d126-a0a4-479c-bed5-2aac326ec0cb'),(8,7,NULL,3,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:09:54','2023-05-06 22:09:54',NULL,NULL,'2d85748b-a1af-46cb-bf6a-9f09d115f01e'),(9,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:09:56','2023-05-06 22:09:59',NULL,NULL,'1e667020-ac21-4063-acfb-ae1ef14bef2d'),(10,9,NULL,4,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:09:59','2023-05-06 22:09:59',NULL,NULL,'0eed325d-e1d2-4b35-85b6-be51f6e67bc7'),(11,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:01','2023-05-06 22:10:04',NULL,NULL,'08845362-8417-41c0-bd17-9792c9cceed9'),(12,11,NULL,5,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:04','2023-05-06 22:10:04',NULL,NULL,'0d86f529-9706-40fb-afdd-c17692a751f1'),(13,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:07','2023-05-06 22:10:11',NULL,NULL,'e790eb2a-a46f-451f-885a-97973dd39657'),(14,13,NULL,6,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:11','2023-05-06 22:10:11',NULL,NULL,'7af0d2eb-cec9-41fb-9a6f-6c313f9dc4da'),(15,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:12','2023-05-06 22:10:15',NULL,NULL,'9f705bd8-8340-4f0d-9f8c-e09dcf0e9fc9'),(16,15,NULL,7,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:15','2023-05-06 22:10:15',NULL,NULL,'24a5f55e-2bf9-4b1d-bbd6-7d2dd7b19f69'),(17,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:16','2023-05-06 22:10:31',NULL,NULL,'6362a05b-1bf8-4dd2-9bc0-1305d3e7947b'),(18,17,NULL,8,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:31','2023-05-06 22:10:31',NULL,NULL,'b1315fdf-bdf5-488e-bc7c-79291f866c2c'),(19,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:32','2023-05-06 22:10:36',NULL,NULL,'99ad6360-43fa-420e-8e5e-ea00bf383eab'),(20,19,NULL,9,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:36','2023-05-06 22:10:36',NULL,NULL,'90a4a6ef-3551-4eb3-8d95-7b3796303972'),(21,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:38','2023-05-06 22:10:41',NULL,'2023-05-07 14:13:53','ed26821c-2add-4928-b72b-60dda1bc1cb0'),(22,21,NULL,10,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:41','2023-05-06 22:10:41',NULL,'2023-05-07 14:13:53','cd8b356e-e1a4-4aed-a5d4-b735db6ebed0'),(23,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:43','2023-05-06 22:10:47',NULL,NULL,'99de8ffa-fd1a-4367-9c94-231f0a875212'),(24,23,NULL,11,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:10:47','2023-05-06 22:10:47',NULL,NULL,'ea3cf8de-fbac-412c-bd92-ba034db661fa'),(25,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:11:00','2023-05-06 22:11:39',NULL,NULL,'018ad1d9-fd75-4f69-b77d-cb41c598a0de'),(26,25,NULL,12,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:11:10','2023-05-06 22:11:10',NULL,NULL,'3fafdaca-445c-4bb5-b139-60c76ff3e747'),(27,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:11:12','2023-05-06 22:11:18',NULL,NULL,'befffa6e-d337-479c-91f7-5c223e6d9566'),(28,27,NULL,13,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:11:18','2023-05-06 22:11:18',NULL,NULL,'a3fd786a-037b-4238-a3ea-1151aa31a580'),(30,25,NULL,14,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:11:39','2023-05-06 22:11:39',NULL,NULL,'c76e87c9-5f1f-47a1-a06a-83f1372be3ec'),(31,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:14:55','2023-05-06 22:15:13',NULL,NULL,'6429a6f8-abe9-446a-9fb7-e91060c07bd1'),(32,31,NULL,15,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:15:01','2023-05-06 22:15:01',NULL,NULL,'ba70c37e-0f55-4798-8cea-701226ca24cf'),(34,31,NULL,16,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:15:13','2023-05-06 22:15:13',NULL,NULL,'815bc0bc-a967-4a31-b112-d753c8ec304e'),(35,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:15:22','2023-05-06 22:15:27',NULL,NULL,'f8ef5307-bfc3-48ac-871b-efc1822d4ae8'),(36,35,NULL,17,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:15:27','2023-05-06 22:15:27',NULL,NULL,'f56d30a5-55d3-4016-9134-4d9fc8db526a'),(37,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:15:29','2023-05-06 22:15:34',NULL,NULL,'313a4977-7994-4fa8-a735-328e0c468646'),(38,37,NULL,18,3,'craft\\elements\\Entry',1,0,'2023-05-06 22:15:34','2023-05-06 22:15:34',NULL,NULL,'6e3c5f0f-16ce-4e16-85df-91f24b150ee6'),(39,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-06 22:15:53','2023-05-06 22:15:53',NULL,NULL,'6c18a80a-1c2b-4094-9642-5a43dbd153a4'),(40,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-06 22:15:55','2023-05-06 22:15:55',NULL,NULL,'3c0f8e6b-6ee6-4034-a8e2-e69e04c17712'),(41,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-06 22:15:56','2023-05-06 22:15:56',NULL,NULL,'21cb70c9-0fe8-454d-a52b-56d5caafeeb7'),(42,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-06 22:16:20','2023-05-06 22:16:21',NULL,'2023-05-06 23:19:39','26cebbc7-6b6b-4f5d-be4f-1aa98a6a3166'),(43,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-06 22:16:21','2023-05-06 22:16:22',NULL,'2023-05-06 23:19:39','95e0c9d6-4351-4680-a3d2-7e02bf2bd51c'),(44,2,NULL,19,2,'craft\\elements\\Entry',1,0,'2023-05-06 22:16:30','2023-05-06 22:16:30',NULL,NULL,'3d9547e1-e14b-46f9-8355-33ce92b4fbb6'),(45,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-06 22:16:35','2023-05-06 22:16:36',NULL,'2023-05-06 23:19:39','9c123d9f-5aec-405f-b8a2-738a039a0bb1'),(47,2,NULL,20,2,'craft\\elements\\Entry',1,0,'2023-05-06 22:16:41','2023-05-06 22:16:41',NULL,NULL,'442267dc-b1de-4980-b9be-82d2cb32c05e'),(48,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-06 23:15:49','2023-05-06 23:20:37',NULL,NULL,'9790b3c6-c30a-4a37-ba30-eddf95bce3ba'),(49,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 23:16:27','2023-05-06 23:16:33',NULL,NULL,'f387392c-cbff-408a-80c2-3f53e358c398'),(50,49,NULL,21,3,'craft\\elements\\Entry',1,0,'2023-05-06 23:16:33','2023-05-06 23:16:33',NULL,NULL,'01372e81-9350-4da4-a907-b4f73e32f945'),(51,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-06 23:16:34','2023-05-06 23:16:38',NULL,NULL,'0913a999-e66b-427f-9bd4-2cec479eff7a'),(52,51,NULL,22,3,'craft\\elements\\Entry',1,0,'2023-05-06 23:16:38','2023-05-06 23:16:38',NULL,NULL,'5e78dd9d-7efa-4176-82d1-5e1af03815a0'),(53,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-06 23:19:20','2023-05-06 23:19:20',NULL,NULL,'a1662405-05e7-4381-8bfd-bb070792f06f'),(54,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-06 23:19:21','2023-05-06 23:19:21',NULL,NULL,'d8f2373b-ac67-45f5-af1f-ad3d0d6ebcae'),(55,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-06 23:19:21','2023-05-06 23:19:21',NULL,NULL,'20faee49-4e0c-45d7-8157-8d23c549679e'),(56,48,NULL,23,2,'craft\\elements\\Entry',1,0,'2023-05-06 23:19:30','2023-05-06 23:19:30',NULL,NULL,'f0964f87-8d9d-4a2e-982b-b6acdfc4a7d9'),(58,2,NULL,24,2,'craft\\elements\\Entry',1,0,'2023-05-06 23:19:55','2023-05-06 23:19:55',NULL,NULL,'38f5202a-a965-4668-ad35-d33e0cece3ab'),(60,48,NULL,25,2,'craft\\elements\\Entry',1,0,'2023-05-06 23:20:37','2023-05-06 23:20:37',NULL,NULL,'ce090f13-3577-4492-978b-c1cd6e6333bc'),(61,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-07 00:28:24','2023-05-07 00:29:15',NULL,NULL,'49c09e1a-d682-40f0-aaa4-567f23f99525'),(62,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 00:29:06','2023-05-07 00:29:06',NULL,NULL,'4633b341-a999-48ef-b39a-1b7d0dcdce60'),(63,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 00:29:07','2023-05-07 00:29:07',NULL,NULL,'78f93e98-6f50-4c20-b20f-329012a6424e'),(64,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 00:29:07','2023-05-07 00:29:07',NULL,NULL,'fe0e1263-308c-4788-bc76-74685c755a2a'),(65,61,NULL,26,2,'craft\\elements\\Entry',1,0,'2023-05-07 00:29:15','2023-05-07 00:29:15',NULL,NULL,'7d641601-a4c0-461a-9387-555a946211c6'),(66,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-07 01:13:22','2023-05-07 14:25:29',NULL,NULL,'89fc953a-bb04-497b-83e6-31c4daddf9b9'),(67,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 01:13:56','2023-05-07 01:13:56',NULL,NULL,'cec52fbf-cdc8-4d78-ba31-a55d974d4a2e'),(68,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 01:13:56','2023-05-07 01:13:56',NULL,NULL,'c837310b-3f1c-40db-b75d-f3a43da297d7'),(69,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 01:13:57','2023-05-07 01:13:57',NULL,NULL,'e43d2640-acb6-456b-bf21-7b97a17e7ce1'),(70,66,NULL,27,2,'craft\\elements\\Entry',1,0,'2023-05-07 01:14:04','2023-05-07 01:14:04',NULL,NULL,'8279c363-83c4-4cee-9502-888942021db3'),(72,66,NULL,28,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:07:41','2023-05-07 14:07:41',NULL,NULL,'126c2b77-5f58-4f18-953c-119ef2ff4a2d'),(73,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:12:47','2023-05-07 14:25:18',NULL,NULL,'08795a41-59a3-4e1b-bd94-51d019aad3af'),(74,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:15:31','2023-05-07 14:15:31',NULL,NULL,'44d9f66e-ca27-411e-9d25-113555eab9ad'),(75,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:15:31','2023-05-07 14:15:31',NULL,NULL,'8598f68f-fd9f-4cfe-8806-ee36c1ada031'),(76,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:15:32','2023-05-07 14:15:32',NULL,NULL,'080009f8-89ce-493c-986c-d798b19b07b8'),(77,73,NULL,29,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:15:39','2023-05-07 14:15:39',NULL,NULL,'50a99795-4ba3-4a11-8414-579454e59003'),(78,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:16:15','2023-05-07 14:17:58',NULL,NULL,'20a094ed-91b1-4283-9585-b5223cf2f4fc'),(79,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:17:52','2023-05-07 14:17:52',NULL,NULL,'6921c7ad-f403-459c-a9f3-392639f24c30'),(80,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:17:53','2023-05-07 14:17:53',NULL,NULL,'94a87c65-25da-4681-9a65-df1e9df98e52'),(81,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:17:53','2023-05-07 14:17:53',NULL,NULL,'387cafe8-be14-4c53-9919-13b7cd552804'),(82,78,NULL,30,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:17:58','2023-05-07 14:17:58',NULL,NULL,'22f6353d-910e-47b8-b361-b15eac99c5b5'),(83,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:20:07','2023-05-07 14:25:11',NULL,NULL,'02b51536-2220-48df-9384-596132ce0418'),(84,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:20:53','2023-05-07 14:20:53',NULL,NULL,'3a4fe430-cd56-4eae-ac02-a03dd1ec2c57'),(85,83,NULL,31,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:20:55','2023-05-07 14:20:55',NULL,NULL,'aed458fc-310c-4ba9-aa7a-7674e82c2c92'),(87,83,NULL,32,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:21:22','2023-05-07 14:21:22',NULL,NULL,'09403e10-19de-4e03-a9d6-be445bb9f832'),(88,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:22:23','2023-05-07 14:23:13',NULL,NULL,'705f75af-d50f-4fcf-9d04-feb6e948afe8'),(89,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:23:10','2023-05-07 14:23:11',NULL,NULL,'a3a306ab-2c84-434d-a667-40fa542818a4'),(90,88,NULL,33,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:23:13','2023-05-07 14:23:13',NULL,NULL,'90c74fcf-8eba-42f1-aca2-69fbf0f1ba0a'),(91,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:24:04','2023-05-07 14:24:59',NULL,NULL,'013ec3b6-02aa-4138-8248-816ae5baad5e'),(92,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-05-07 14:24:22','2023-05-07 14:24:26',NULL,NULL,'49e403cc-ed53-49e3-b9d5-076e7a1d6b81'),(93,92,NULL,34,3,'craft\\elements\\Entry',1,0,'2023-05-07 14:24:26','2023-05-07 14:24:26',NULL,NULL,'d753dc94-a8b3-462c-976b-eba5754af0b0'),(94,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:24:56','2023-05-07 14:24:57',NULL,NULL,'c32587d6-a675-472d-b300-7bb03fb338ad'),(95,91,NULL,35,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:24:59','2023-05-07 14:24:59',NULL,NULL,'a05cd420-4d01-4686-87db-8713e5df6528'),(97,83,NULL,36,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:25:11','2023-05-07 14:25:11',NULL,NULL,'46fb110e-c21a-4469-b34d-e07e7b954fcc'),(99,73,NULL,37,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:25:18','2023-05-07 14:25:18',NULL,NULL,'068a9ca7-e4d1-4c5a-84ed-a1d77aacf274'),(101,66,NULL,38,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:25:29','2023-05-07 14:25:29',NULL,NULL,'dc5e2954-746c-462d-889d-62cf3e4bf0c2'),(102,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:26:26','2023-05-07 14:28:06',NULL,NULL,'4ac0b8fa-50ab-4021-a8e4-043adf8794e2'),(103,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:28:04','2023-05-07 14:28:04',NULL,NULL,'b9d1c577-d40f-48a6-b1e1-494059fc79d2'),(104,102,NULL,39,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:28:06','2023-05-07 14:28:06',NULL,NULL,'028550cf-7f60-4f61-96df-c3f4a74c7dd9'),(105,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:29:14','2023-05-07 14:29:36',NULL,NULL,'6e53e276-9f74-49ca-8932-8142662fca70'),(106,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:29:34','2023-05-07 14:29:34',NULL,NULL,'ed41b06c-5352-47df-b3bd-ee6206d82b00'),(107,105,NULL,40,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:29:36','2023-05-07 14:29:36',NULL,NULL,'efe87d49-fc59-4883-a73e-308645acb3df'),(108,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:30:50','2023-05-07 14:31:34',NULL,NULL,'bbbc0281-c132-4ad0-800d-55ac77657f80'),(109,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-05-07 14:31:32','2023-05-07 14:31:32',NULL,NULL,'c9f0a037-56f8-4220-8b2f-d8c64c72ac6c'),(110,108,NULL,41,2,'craft\\elements\\Entry',1,0,'2023-05-07 14:31:34','2023-05-07 14:31:34',NULL,NULL,'0329b453-2b02-4431-885c-0fe7ca03a6b0');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-02-02 05:28:23','2023-02-02 05:28:23','9276ec33-c4e9-4f94-9590-a6c8f9ed630a'),(2,2,1,'bacalar-lagoon-mexico',NULL,1,'2023-05-06 22:06:23','2023-05-06 22:14:39','9a0d3a78-d4e9-4779-b864-9c9a4471d8eb'),(3,3,1,'mountains',NULL,1,'2023-05-06 22:09:36','2023-05-06 22:09:41','c0aa88d0-85e7-47d4-90bd-0fe0809e1acd'),(4,4,1,'mountains',NULL,1,'2023-05-06 22:09:41','2023-05-06 22:09:41','4e61aa37-04b3-4970-ba57-4ebb9a7595c0'),(5,5,1,'jungle',NULL,1,'2023-05-06 22:09:43','2023-05-06 22:09:49','011d421b-4c20-4cae-a817-b4c96e5d9f02'),(6,6,1,'jungle',NULL,1,'2023-05-06 22:09:49','2023-05-06 22:09:49','c866f58f-c716-419b-905d-b06f18538e77'),(7,7,1,'forest',NULL,1,'2023-05-06 22:09:51','2023-05-06 22:09:54','1fe83fcd-5308-4568-8da5-656f6ce6fe57'),(8,8,1,'forest',NULL,1,'2023-05-06 22:09:54','2023-05-06 22:09:54','8121f68b-dc49-4408-961c-3bc69a94105a'),(9,9,1,'lake',NULL,1,'2023-05-06 22:09:56','2023-05-06 22:09:59','f5432337-d3f8-4233-993e-79a1e05b09fe'),(10,10,1,'lake',NULL,1,'2023-05-06 22:09:59','2023-05-06 22:09:59','27337bd5-9432-43ee-89fc-d551c1e8bc5c'),(11,11,1,'river',NULL,1,'2023-05-06 22:10:01','2023-05-06 22:10:04','fd113082-ec65-4ad8-b716-4c93e91d1281'),(12,12,1,'river',NULL,1,'2023-05-06 22:10:04','2023-05-06 22:10:04','d3154937-81cf-45f3-8403-96ffca75070c'),(13,13,1,'countryside',NULL,1,'2023-05-06 22:10:07','2023-05-06 22:10:11','2059cb0a-032f-4c90-82e1-4786e520b203'),(14,14,1,'countryside',NULL,1,'2023-05-06 22:10:11','2023-05-06 22:10:11','7f432cf5-ac64-4ad3-a5c0-bc3ef06ecec5'),(15,15,1,'city',NULL,1,'2023-05-06 22:10:12','2023-05-06 22:10:15','71e71002-42d8-4ec4-8879-48f8e13e295f'),(16,16,1,'city',NULL,1,'2023-05-06 22:10:15','2023-05-06 22:10:15','24555589-4f5f-46e8-96ad-09ddf6ce38bb'),(17,17,1,'nightlife',NULL,1,'2023-05-06 22:10:16','2023-05-06 22:10:31','88d94477-def8-4320-930f-59da87811c87'),(18,18,1,'nightlife',NULL,1,'2023-05-06 22:10:31','2023-05-06 22:10:31','9fa811c5-39ed-4a07-9244-cfcd1abdc882'),(19,19,1,'beach',NULL,1,'2023-05-06 22:10:32','2023-05-06 22:10:36','f0c0ec41-6149-45f6-9ad9-e2f2c7c38a0a'),(20,20,1,'beach',NULL,1,'2023-05-06 22:10:36','2023-05-06 22:10:36','89baa8a0-adae-4dc4-ad54-628f8bc90cf3'),(21,21,1,'party',NULL,1,'2023-05-06 22:10:38','2023-05-06 22:10:41','74bd652d-8202-40ae-a510-233a2f74f83d'),(22,22,1,'party',NULL,1,'2023-05-06 22:10:41','2023-05-06 22:10:41','fff75ac7-02be-4a17-8618-148d7a3a85c9'),(23,23,1,'retreat',NULL,1,'2023-05-06 22:10:43','2023-05-06 22:10:47','58b3d43e-487d-4182-a409-178f14cd4850'),(24,24,1,'retreat',NULL,1,'2023-05-06 22:10:47','2023-05-06 22:10:47','d7e0d126-66c0-4065-b469-785c624fcc7d'),(25,25,1,'outdoor-activities',NULL,1,'2023-05-06 22:11:00','2023-05-06 22:11:39','5d76badd-08a6-4c1f-bbb2-c85a36157304'),(26,26,1,'hiking',NULL,1,'2023-05-06 22:11:10','2023-05-06 22:11:10','47a0dc4f-cc2f-45d1-8508-db18da7a1f89'),(27,27,1,'extreme-sports',NULL,1,'2023-05-06 22:11:12','2023-05-06 22:11:18','9bb7460d-1d30-4d3e-b34d-693613243d82'),(28,28,1,'extreme-sports',NULL,1,'2023-05-06 22:11:18','2023-05-06 22:11:18','65ca769c-6c73-418b-be5a-bad359f84133'),(30,30,1,'outdoor-activities',NULL,1,'2023-05-06 22:11:39','2023-05-06 22:11:39','a4556477-e0cc-421a-83a6-82f773b04b9c'),(31,31,1,'water-sports',NULL,1,'2023-05-06 22:14:55','2023-05-06 22:15:13','758724a6-b78e-4857-97b9-d2d47e90df3a'),(32,32,1,'water-sprots',NULL,1,'2023-05-06 22:15:01','2023-05-06 22:15:01','f8e0ffc7-5364-40b5-a69d-871105fed42c'),(34,34,1,'water-sports',NULL,1,'2023-05-06 22:15:13','2023-05-06 22:15:13','59887f90-ff5e-4822-b298-c633ec9c4878'),(35,35,1,'desert',NULL,1,'2023-05-06 22:15:22','2023-05-06 22:15:27','b65edb3a-9ecc-4d3f-bc14-bec2c428edc6'),(36,36,1,'desert',NULL,1,'2023-05-06 22:15:27','2023-05-06 22:15:27','f5ae0cfd-f9e9-4b6b-970f-c3a96f2c437a'),(37,37,1,'tropical',NULL,1,'2023-05-06 22:15:29','2023-05-06 22:15:34','87ccab6c-c3ee-4a16-96de-ee9581f778cc'),(38,38,1,'tropical',NULL,1,'2023-05-06 22:15:34','2023-05-06 22:15:34','419b4926-39ec-462a-9d4e-8393cbdb2d70'),(39,39,1,NULL,NULL,1,'2023-05-06 22:15:53','2023-05-06 22:15:53','f6af13af-5bce-4750-a876-11970c27ed4e'),(40,40,1,NULL,NULL,1,'2023-05-06 22:15:55','2023-05-06 22:15:55','c9ba7276-cd24-49b0-818e-ef2cd2e4f80b'),(41,41,1,NULL,NULL,1,'2023-05-06 22:15:56','2023-05-06 22:15:56','8b9aaa60-23d4-42e8-b275-6b3acfe7facd'),(42,42,1,NULL,NULL,1,'2023-05-06 22:16:20','2023-05-06 22:16:20','c12e64dd-4c34-4260-b4fa-1534f1a4a9a1'),(43,43,1,NULL,NULL,1,'2023-05-06 22:16:21','2023-05-06 22:16:21','7799c462-5cec-4796-ae8e-77400361fc2e'),(44,44,1,'bacalar-lagoon-mexico',NULL,1,'2023-05-06 22:16:30','2023-05-06 22:16:30','8d9c3c89-0b3e-47ba-adae-ea5a32e1a42f'),(45,45,1,NULL,NULL,1,'2023-05-06 22:16:35','2023-05-06 22:16:35','9b42a711-23a4-466a-8dd4-395098831b70'),(47,47,1,'bacalar-lagoon-mexico',NULL,1,'2023-05-06 22:16:41','2023-05-06 22:16:41','d1b05f7c-51d4-495c-9b20-03b093d86a9f'),(48,48,1,'chichén-itzá-mexico',NULL,1,'2023-05-06 23:15:49','2023-05-06 23:20:37','0ebcca5f-a002-4712-986b-6d20783266ab'),(49,49,1,'ruins',NULL,1,'2023-05-06 23:16:27','2023-05-06 23:16:33','609a5596-7b68-4acd-a7a4-bb0ffe117113'),(50,50,1,'ruins',NULL,1,'2023-05-06 23:16:33','2023-05-06 23:16:33','c3b7ea22-999b-4512-802a-d427252b7be2'),(51,51,1,'historic',NULL,1,'2023-05-06 23:16:34','2023-05-06 23:16:38','353c6530-b1f1-42b6-b940-d4a43e463a48'),(52,52,1,'historic',NULL,1,'2023-05-06 23:16:38','2023-05-06 23:16:38','448b236a-6bc7-4d2c-aead-45c6edb0afb1'),(53,53,1,NULL,NULL,1,'2023-05-06 23:19:20','2023-05-06 23:19:20','70c08def-adca-4c72-9bd5-5853f100b1ab'),(54,54,1,NULL,NULL,1,'2023-05-06 23:19:21','2023-05-06 23:19:21','8ed213c6-826c-4b1d-99c2-1a1567f627fa'),(55,55,1,NULL,NULL,1,'2023-05-06 23:19:21','2023-05-06 23:19:21','5a354dd2-35be-451a-ba50-40b57fc65389'),(56,56,1,'chichén-itzá',NULL,1,'2023-05-06 23:19:30','2023-05-06 23:19:30','d9401a8c-ec0e-45f7-84f4-377775e845d0'),(58,58,1,'bacalar-lagoon-mexico',NULL,1,'2023-05-06 23:19:55','2023-05-06 23:19:55','16ee047f-8b75-4e09-a470-4cd4ddf32828'),(60,60,1,'chichén-itzá-mexico',NULL,1,'2023-05-06 23:20:37','2023-05-06 23:20:37','be008aa1-5068-46f5-ac06-d34c6e9ece4e'),(61,61,1,'uvita-costa-rica',NULL,1,'2023-05-07 00:28:24','2023-05-07 00:28:36','0a5a9842-c660-4b38-87de-8293f2ecb322'),(62,62,1,NULL,NULL,1,'2023-05-07 00:29:06','2023-05-07 00:29:06','72557861-38b7-402a-bc87-45f86e784609'),(63,63,1,NULL,NULL,1,'2023-05-07 00:29:07','2023-05-07 00:29:07','bc072c3b-7296-440a-87b9-77ac18a2691c'),(64,64,1,NULL,NULL,1,'2023-05-07 00:29:07','2023-05-07 00:29:07','d4392505-012d-439c-9c09-6c631275787d'),(65,65,1,'uvita-costa-rica',NULL,1,'2023-05-07 00:29:15','2023-05-07 00:29:15','e9d2cb0f-54bd-4ff1-baed-d122432d7ada'),(66,66,1,'rio-de-janeiro-brazil',NULL,1,'2023-05-07 01:13:22','2023-05-07 14:07:41','d365863a-b026-4264-9025-789242012a66'),(67,67,1,NULL,NULL,1,'2023-05-07 01:13:56','2023-05-07 01:13:56','1cb9a005-7ccc-4123-b555-f4bd877338ad'),(68,68,1,NULL,NULL,1,'2023-05-07 01:13:56','2023-05-07 01:13:56','21b09303-d95b-4a1a-ad20-7cadd962db05'),(69,69,1,NULL,NULL,1,'2023-05-07 01:13:57','2023-05-07 01:13:57','ec7996ff-21fe-44c8-b493-24059a8b7659'),(70,70,1,'rio-de-janeiro',NULL,1,'2023-05-07 01:14:04','2023-05-07 01:14:04','9f8e7550-c376-4b02-b581-dfae4525e443'),(72,72,1,'rio-de-janeiro-brazil',NULL,1,'2023-05-07 14:07:41','2023-05-07 14:07:41','5889eb5f-b3af-4ad6-9268-1714ebfa4543'),(73,73,1,'barcelona-spain',NULL,1,'2023-05-07 14:12:47','2023-05-07 14:13:03','5cf7fb75-940e-4177-9dc0-ffd7e6885a9d'),(74,74,1,NULL,NULL,1,'2023-05-07 14:15:31','2023-05-07 14:15:31','cc17ef1d-05dd-40ce-82ec-33a2807d2153'),(75,75,1,NULL,NULL,1,'2023-05-07 14:15:31','2023-05-07 14:15:31','d7e2c7d2-3053-407d-a54f-e7f04d848c7a'),(76,76,1,NULL,NULL,1,'2023-05-07 14:15:32','2023-05-07 14:15:32','b28081d5-ba81-4891-b431-d08ebbb39bc8'),(77,77,1,'barcelona-spain',NULL,1,'2023-05-07 14:15:39','2023-05-07 14:15:39','d6ca9dfe-6d6d-4330-aadc-09cd682ea099'),(78,78,1,'london-united-kingdom',NULL,1,'2023-05-07 14:16:15','2023-05-07 14:16:22','530b6bb1-a6de-49c0-924e-ee829774fcf8'),(79,79,1,NULL,NULL,1,'2023-05-07 14:17:52','2023-05-07 14:17:52','5f481457-a9c2-4582-b76c-900dbb5d901a'),(80,80,1,NULL,NULL,1,'2023-05-07 14:17:53','2023-05-07 14:17:53','bb9f1001-acba-47cb-93e3-29289f781002'),(81,81,1,NULL,NULL,1,'2023-05-07 14:17:53','2023-05-07 14:17:53','f13f31e8-f73d-4ae7-b368-755e6ede2ecf'),(82,82,1,'london-united-kingdom',NULL,1,'2023-05-07 14:17:58','2023-05-07 14:17:58','8a836c1b-2b49-4c42-bb2c-ca79167c9310'),(83,83,1,'the-burren-ireland',NULL,1,'2023-05-07 14:20:07','2023-05-07 14:20:14','40c1ac9f-cff0-4890-823c-d2fc48d7069b'),(84,84,1,NULL,NULL,1,'2023-05-07 14:20:53','2023-05-07 14:20:53','acd4882a-df1e-45a9-a805-cec948ea7cd2'),(85,85,1,'the-burren-ireland',NULL,1,'2023-05-07 14:20:55','2023-05-07 14:20:55','28488165-2ade-4c8e-b581-54ccc024571f'),(87,87,1,'the-burren-ireland',NULL,1,'2023-05-07 14:21:22','2023-05-07 14:21:22','6680f8fa-2607-4002-9c3c-777c06c9189a'),(88,88,1,'sankt-gilgen-austria',NULL,1,'2023-05-07 14:22:23','2023-05-07 14:22:24','d60ad0b7-3794-428b-80ac-b564f790c421'),(89,89,1,NULL,NULL,1,'2023-05-07 14:23:10','2023-05-07 14:23:10','e488210d-2e0d-4c33-a3a5-dae24a72396b'),(90,90,1,'sankt-gilgen-austria',NULL,1,'2023-05-07 14:23:13','2023-05-07 14:23:13','b68eeae7-5331-4e46-a2f4-fde448c81b5f'),(91,91,1,'lofoten-norway',NULL,1,'2023-05-07 14:24:04','2023-05-07 14:24:08','68cbefb7-fc35-45d2-8e95-203d6c55892a'),(92,92,1,'sea',NULL,1,'2023-05-07 14:24:22','2023-05-07 14:24:26','45fa9d5c-c89f-496e-bb64-7ca2caed2c60'),(93,93,1,'sea',NULL,1,'2023-05-07 14:24:26','2023-05-07 14:24:26','e906a448-7e90-4339-85d4-bf0f5216f1df'),(94,94,1,NULL,NULL,1,'2023-05-07 14:24:56','2023-05-07 14:24:56','bce9b0f2-d925-4974-aa1c-9a395c4bd507'),(95,95,1,'lofoten-norway',NULL,1,'2023-05-07 14:24:59','2023-05-07 14:24:59','90e34ac4-581c-42dd-a57a-f4c649b434f9'),(97,97,1,'the-burren-ireland',NULL,1,'2023-05-07 14:25:11','2023-05-07 14:25:11','e11b68f9-8e60-4660-854d-ef039c2597ea'),(99,99,1,'barcelona-spain',NULL,1,'2023-05-07 14:25:18','2023-05-07 14:25:18','8fd91da7-eec4-42bd-8707-476426890220'),(101,101,1,'rio-de-janeiro-brazil',NULL,1,'2023-05-07 14:25:29','2023-05-07 14:25:29','a7942a30-24c9-4c0c-96fa-b068468ffb2c'),(102,102,1,'tokyo-japan',NULL,1,'2023-05-07 14:26:26','2023-05-07 14:27:23','b4f905f9-ba21-414d-9825-6569a1275386'),(103,103,1,NULL,NULL,1,'2023-05-07 14:28:04','2023-05-07 14:28:04','dff178aa-8634-4756-a600-3889fb6ca23f'),(104,104,1,'tokyo-japan',NULL,1,'2023-05-07 14:28:06','2023-05-07 14:28:06','afc87599-b719-4d50-be38-902617da837c'),(105,105,1,'petra-jordan',NULL,1,'2023-05-07 14:29:14','2023-05-07 14:29:17','58f1b495-02d5-4946-bae7-08b2b9ee6028'),(106,106,1,NULL,NULL,1,'2023-05-07 14:29:34','2023-05-07 14:29:34','7881ced6-56f3-4c8d-b443-58df0c7a2fce'),(107,107,1,'petra-jordan',NULL,1,'2023-05-07 14:29:36','2023-05-07 14:29:36','bd5ff623-7299-4884-8df2-eca9d13510f9'),(108,108,1,'kings-canyon-australia',NULL,1,'2023-05-07 14:30:50','2023-05-07 14:30:53','8abda743-28e1-4726-bda8-cbaad85e3c1e'),(109,109,1,NULL,NULL,1,'2023-05-07 14:31:32','2023-05-07 14:31:32','e64efdaf-dc2f-4757-873e-b9f0869f3ea9'),(110,110,1,'kings-canyon-australia',NULL,1,'2023-05-07 14:31:34','2023-05-07 14:31:34','77426495-d1c3-42ca-8000-162dd3fce370');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,1,'2023-05-06 22:16:00',NULL,NULL,'2023-05-06 22:06:23','2023-05-06 22:16:30'),(3,2,NULL,2,1,'2023-05-06 22:09:00',NULL,NULL,'2023-05-06 22:09:36','2023-05-06 22:09:41'),(4,2,NULL,2,1,'2023-05-06 22:09:00',NULL,NULL,'2023-05-06 22:09:41','2023-05-06 22:09:41'),(5,2,NULL,2,1,'2023-05-06 22:09:00',NULL,NULL,'2023-05-06 22:09:43','2023-05-06 22:09:49'),(6,2,NULL,2,1,'2023-05-06 22:09:00',NULL,NULL,'2023-05-06 22:09:49','2023-05-06 22:09:49'),(7,2,NULL,2,1,'2023-05-06 22:09:00',NULL,NULL,'2023-05-06 22:09:51','2023-05-06 22:09:54'),(8,2,NULL,2,1,'2023-05-06 22:09:00',NULL,NULL,'2023-05-06 22:09:54','2023-05-06 22:09:54'),(9,2,NULL,2,1,'2023-05-06 22:09:00',NULL,NULL,'2023-05-06 22:09:56','2023-05-06 22:09:59'),(10,2,NULL,2,1,'2023-05-06 22:09:00',NULL,NULL,'2023-05-06 22:09:59','2023-05-06 22:09:59'),(11,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:01','2023-05-06 22:10:04'),(12,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:04','2023-05-06 22:10:04'),(13,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:07','2023-05-06 22:10:11'),(14,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:11','2023-05-06 22:10:11'),(15,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:12','2023-05-06 22:10:15'),(16,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:15','2023-05-06 22:10:15'),(17,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:16','2023-05-06 22:10:31'),(18,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:31','2023-05-06 22:10:31'),(19,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:32','2023-05-06 22:10:36'),(20,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:36','2023-05-06 22:10:36'),(21,2,NULL,2,1,'2023-05-06 22:10:00',NULL,0,'2023-05-06 22:10:38','2023-05-06 22:10:41'),(22,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:41','2023-05-06 22:10:41'),(23,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:43','2023-05-06 22:10:47'),(24,2,NULL,2,1,'2023-05-06 22:10:00',NULL,NULL,'2023-05-06 22:10:47','2023-05-06 22:10:47'),(25,2,NULL,2,1,'2023-05-06 22:11:00',NULL,NULL,'2023-05-06 22:11:00','2023-05-06 22:11:00'),(26,2,NULL,2,1,'2023-05-06 22:11:00',NULL,NULL,'2023-05-06 22:11:10','2023-05-06 22:11:10'),(27,2,NULL,2,1,'2023-05-06 22:11:00',NULL,NULL,'2023-05-06 22:11:12','2023-05-06 22:11:18'),(28,2,NULL,2,1,'2023-05-06 22:11:00',NULL,NULL,'2023-05-06 22:11:18','2023-05-06 22:11:18'),(30,2,NULL,2,1,'2023-05-06 22:11:00',NULL,NULL,'2023-05-06 22:11:39','2023-05-06 22:11:39'),(31,2,NULL,2,1,'2023-05-06 22:15:00',NULL,NULL,'2023-05-06 22:14:55','2023-05-06 22:15:01'),(32,2,NULL,2,1,'2023-05-06 22:15:00',NULL,NULL,'2023-05-06 22:15:01','2023-05-06 22:15:01'),(34,2,NULL,2,1,'2023-05-06 22:15:00',NULL,NULL,'2023-05-06 22:15:13','2023-05-06 22:15:13'),(35,2,NULL,2,1,'2023-05-06 22:15:00',NULL,NULL,'2023-05-06 22:15:22','2023-05-06 22:15:27'),(36,2,NULL,2,1,'2023-05-06 22:15:00',NULL,NULL,'2023-05-06 22:15:27','2023-05-06 22:15:27'),(37,2,NULL,2,1,'2023-05-06 22:15:00',NULL,NULL,'2023-05-06 22:15:29','2023-05-06 22:15:34'),(38,2,NULL,2,1,'2023-05-06 22:15:00',NULL,NULL,'2023-05-06 22:15:34','2023-05-06 22:15:34'),(44,1,NULL,1,1,'2023-05-06 22:16:00',NULL,NULL,'2023-05-06 22:16:30','2023-05-06 22:16:30'),(47,1,NULL,1,1,'2023-05-06 22:16:00',NULL,NULL,'2023-05-06 22:16:41','2023-05-06 22:16:41'),(48,1,NULL,1,1,'2023-05-06 23:19:00',NULL,NULL,'2023-05-06 23:15:49','2023-05-06 23:19:30'),(49,2,NULL,2,1,'2023-05-06 23:16:00',NULL,NULL,'2023-05-06 23:16:27','2023-05-06 23:16:33'),(50,2,NULL,2,1,'2023-05-06 23:16:00',NULL,NULL,'2023-05-06 23:16:33','2023-05-06 23:16:33'),(51,2,NULL,2,1,'2023-05-06 23:16:00',NULL,NULL,'2023-05-06 23:16:34','2023-05-06 23:16:38'),(52,2,NULL,2,1,'2023-05-06 23:16:00',NULL,NULL,'2023-05-06 23:16:38','2023-05-06 23:16:38'),(56,1,NULL,1,1,'2023-05-06 23:19:00',NULL,NULL,'2023-05-06 23:19:30','2023-05-06 23:19:30'),(58,1,NULL,1,1,'2023-05-06 22:16:00',NULL,NULL,'2023-05-06 23:19:55','2023-05-06 23:19:55'),(60,1,NULL,1,1,'2023-05-06 23:19:00',NULL,NULL,'2023-05-06 23:20:37','2023-05-06 23:20:37'),(61,1,NULL,1,1,'2023-05-07 00:29:00',NULL,NULL,'2023-05-07 00:28:24','2023-05-07 00:29:15'),(65,1,NULL,1,1,'2023-05-07 00:29:00',NULL,NULL,'2023-05-07 00:29:15','2023-05-07 00:29:15'),(66,1,NULL,1,1,'2023-05-07 01:14:00',NULL,NULL,'2023-05-07 01:13:22','2023-05-07 01:14:04'),(70,1,NULL,1,1,'2023-05-07 01:14:00',NULL,NULL,'2023-05-07 01:14:04','2023-05-07 01:14:04'),(72,1,NULL,1,1,'2023-05-07 01:14:00',NULL,NULL,'2023-05-07 14:07:41','2023-05-07 14:07:41'),(73,1,NULL,1,1,'2023-05-07 14:15:00',NULL,NULL,'2023-05-07 14:12:47','2023-05-07 14:15:39'),(77,1,NULL,1,1,'2023-05-07 14:15:00',NULL,NULL,'2023-05-07 14:15:39','2023-05-07 14:15:39'),(78,1,NULL,1,1,'2023-05-07 14:17:00',NULL,NULL,'2023-05-07 14:16:15','2023-05-07 14:17:58'),(82,1,NULL,1,1,'2023-05-07 14:17:00',NULL,NULL,'2023-05-07 14:17:58','2023-05-07 14:17:58'),(83,1,NULL,1,1,'2023-05-07 14:20:00',NULL,NULL,'2023-05-07 14:20:07','2023-05-07 14:20:55'),(85,1,NULL,1,1,'2023-05-07 14:20:00',NULL,NULL,'2023-05-07 14:20:55','2023-05-07 14:20:55'),(87,1,NULL,1,1,'2023-05-07 14:20:00',NULL,NULL,'2023-05-07 14:21:22','2023-05-07 14:21:22'),(88,1,NULL,1,1,'2023-05-07 14:23:00',NULL,NULL,'2023-05-07 14:22:23','2023-05-07 14:23:13'),(90,1,NULL,1,1,'2023-05-07 14:23:00',NULL,NULL,'2023-05-07 14:23:13','2023-05-07 14:23:13'),(91,1,NULL,1,1,'2023-05-07 14:24:00',NULL,NULL,'2023-05-07 14:24:04','2023-05-07 14:24:59'),(92,2,NULL,2,1,'2023-05-07 14:24:00',NULL,NULL,'2023-05-07 14:24:22','2023-05-07 14:24:26'),(93,2,NULL,2,1,'2023-05-07 14:24:00',NULL,NULL,'2023-05-07 14:24:26','2023-05-07 14:24:26'),(95,1,NULL,1,1,'2023-05-07 14:24:00',NULL,NULL,'2023-05-07 14:24:59','2023-05-07 14:24:59'),(97,1,NULL,1,1,'2023-05-07 14:20:00',NULL,NULL,'2023-05-07 14:25:11','2023-05-07 14:25:11'),(99,1,NULL,1,1,'2023-05-07 14:15:00',NULL,NULL,'2023-05-07 14:25:18','2023-05-07 14:25:18'),(101,1,NULL,1,1,'2023-05-07 01:14:00',NULL,NULL,'2023-05-07 14:25:29','2023-05-07 14:25:29'),(102,1,NULL,1,1,'2023-05-07 14:28:00',NULL,NULL,'2023-05-07 14:26:26','2023-05-07 14:28:06'),(104,1,NULL,1,1,'2023-05-07 14:28:00',NULL,NULL,'2023-05-07 14:28:06','2023-05-07 14:28:06'),(105,1,NULL,1,1,'2023-05-07 14:29:00',NULL,NULL,'2023-05-07 14:29:14','2023-05-07 14:29:36'),(107,1,NULL,1,1,'2023-05-07 14:29:00',NULL,NULL,'2023-05-07 14:29:36','2023-05-07 14:29:36'),(108,1,NULL,1,1,'2023-05-07 14:31:00',NULL,NULL,'2023-05-07 14:30:50','2023-05-07 14:31:34'),(110,1,NULL,1,1,'2023-05-07 14:31:00',NULL,NULL,'2023-05-07 14:31:34','2023-05-07 14:31:34');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,2,'Default','default',1,'site',NULL,NULL,1,'2023-05-06 22:04:13','2023-05-06 22:04:13',NULL,'95c24f9a-1f75-4390-bcb0-338dec4c5d6e'),(2,2,3,'Default','default',1,'site',NULL,NULL,1,'2023-05-06 22:04:29','2023-05-06 22:04:29',NULL,'bf91aaf1-1e7d-46e2-b008-347b1922d419');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-02-02 05:28:23','2023-02-02 05:28:23',NULL,'31006d4c-2f40-498c-9a4c-69cff4fd4279');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (1,2,4,2,0,1,'2023-05-06 22:06:47','2023-05-06 22:06:47','c8de6ca1-bac2-489f-a101-66a999cf3a29'),(2,2,4,1,0,2,'2023-05-06 22:06:47','2023-05-06 22:06:47','1a3ed3f0-2364-47c2-a199-f63370c6d74e');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Asset','2023-05-06 22:02:28','2023-05-06 22:02:28',NULL,'ac14f975-fb51-483c-a01c-a84d207221b8'),(2,'craft\\elements\\Entry','2023-05-06 22:04:13','2023-05-06 22:04:13',NULL,'ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd'),(3,'craft\\elements\\Entry','2023-05-06 22:04:29','2023-05-06 22:04:29',NULL,'f08c4615-4348-49aa-8eeb-6023970fffc1'),(4,'craft\\elements\\User','2023-05-06 23:11:25','2023-05-06 23:11:25',NULL,'efa3e201-3541-4f47-8e71-0c3af28af042');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (1,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"1e751d34-d70c-4713-a2f7-cf941e0548ce\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-05-06 22:02:28','2023-05-06 22:02:28','1df019a3-392a-44f3-809b-3ae70c1a8a87'),(3,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"4601beac-0a71-44be-bd63-228970ab069a\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-05-06 22:04:29','2023-05-06 22:04:29','4ff4e5ba-78ab-47b9-b0d4-fc3c18e59d22'),(4,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"1a02f706-2b60-4ec1-9a77-96a5d82a53b0\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"19c0af6a-f83f-4a70-acbf-7d665a802d29\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"3a520d1b-b605-44aa-8200-d7784b974f5b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"995e02b1-8b8b-45df-b690-5c9b38be1961\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"dcc6c87b-20a8-4fc8-847d-51fd4e86314d\"}]',1,'2023-05-06 22:06:47','2023-05-06 22:06:47','79539452-eba4-496b-882a-05e6b85a8053'),(5,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"65552c99-e03e-4325-8ae1-7842d1e20c91\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4a74e36f-904e-4c5f-aafe-04db0a6fe71f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"4bc1c352-6843-429d-b811-c6f740d26297\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"649c9c5a-c95e-489d-9c06-8df52e628f93\"}]',1,'2023-05-06 23:11:25','2023-05-06 23:11:25','d4d39176-6fae-4bf2-804f-b03e0be329f1');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Images','images','global',NULL,'One or more images of the destination. Only the first image should be displayed in a “top recommendation”.',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:bdc98c9f-a066-45ba-89bd-6b5a5da7ae74\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":1,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:bdc98c9f-a066-45ba-89bd-6b5a5da7ae74\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":\"Add an image\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:bdc98c9f-a066-45ba-89bd-6b5a5da7ae74\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2023-05-06 22:03:21','2023-05-06 22:07:58','dcc6c87b-20a8-4fc8-847d-51fd4e86314d'),(2,1,'Tags','tags','global',NULL,'Up to weighted 5 tags that describe the destination. The first tag gets the most weight and the last tag gets the least weight.',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":5,\"minRelations\":1,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"},\"selectionLabel\":\"Add a tag\",\"showSiteMenu\":true,\"sources\":[\"section:7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-05-06 22:03:41','2023-05-07 17:01:38','3a520d1b-b605-44aa-8200-d7784b974f5b');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `imagetransforms` VALUES (1,'Large','large','crop','center-center',1200,700,NULL,NULL,'none',NULL,1,'2023-05-07 17:51:44','2023-05-06 22:28:14','2023-05-07 17:51:44','c77a98f6-d4a2-4935-a4cf-201a26cbe8c3'),(2,'Small','small','crop','center-center',350,200,NULL,NULL,'none',NULL,1,'2023-05-07 17:51:50','2023-05-06 22:57:21','2023-05-07 17:51:50','858c43d9-04c3-4a37-865f-ff5ad2d4e8e8');
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.4.9','4.4.0.4',0,'pdoezacnqjjv','3@kqvrtgnsxi','2023-02-02 05:28:23','2023-05-07 17:51:50','876de66d-7fde-40c5-b8b8-c4713c00d927');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','32ccba4d-556b-4fcd-9e7c-73a2e60aed4d'),(2,'craft','m210121_145800_asset_indexing_changes','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','110963d6-acbc-4052-ba24-5343051e4663'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','09e2ddd5-cb53-449a-bb38-f233c1571174'),(4,'craft','m210724_180756_rename_source_cols','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ecb98123-06eb-4d65-9dae-588f920f5d1b'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','4de6ac73-1c13-4a53-8eaf-565ed1117d92'),(6,'craft','m210817_014201_universal_users','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','130028a6-a406-4471-96fb-6758b9525b0e'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','4b37ada2-81f1-4985-b0e5-e674b34e2968'),(8,'craft','m211115_135500_image_transformers','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','34b2fc16-745c-42d5-b4fb-e7ffbc312d7b'),(9,'craft','m211201_131000_filesystems','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','aca6e315-e112-496c-ba73-6e19bb36b7f3'),(10,'craft','m220103_043103_tab_conditions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','8aa8b2fe-a585-4c84-8e23-1b3045b48e7a'),(11,'craft','m220104_003433_asset_alt_text','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','51804ab1-3c62-442e-a212-6fb539d779d5'),(12,'craft','m220123_213619_update_permissions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','72bd9363-4be6-4094-bc55-b0aaf45b391b'),(13,'craft','m220126_003432_addresses','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','beb0b304-1443-4ca0-92e2-e2a93c99298f'),(14,'craft','m220209_095604_add_indexes','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','014c11d1-9f1b-4af9-b67b-6252d934ac91'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','25e7db17-b5f4-470a-adf0-dae78569929b'),(16,'craft','m220214_000000_truncate_sessions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','1451ff20-81bc-4270-890e-76ab3ede9c1c'),(17,'craft','m220222_122159_full_names','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','582ce54c-5d9d-42e4-a7ed-f01688cdc688'),(18,'craft','m220223_180559_nullable_address_owner','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','b95f7ab9-3df4-4bd2-bb9c-63a725405fa2'),(19,'craft','m220225_165000_transform_filesystems','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','04098051-2cc1-4706-96fc-6bd2af52dce4'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ef9220f2-be58-466a-b464-dfa3a1c56e5d'),(21,'craft','m220314_211928_field_layout_element_uids','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','e1788361-9335-4b86-b917-08bbcab2cadb'),(22,'craft','m220316_123800_transform_fs_subpath','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ac64d940-5a66-4f42-963d-0b31a660e0bd'),(23,'craft','m220317_174250_release_all_jobs','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','aa45919d-0094-40b9-9b56-12243f138a81'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','15f9020e-4c57-4f00-a078-78245121f93f'),(25,'craft','m220413_024536_site_enabled_string','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','f7899074-4588-4744-be09-408addd05e81'),(26,'craft','m221027_160703_add_image_transform_fill','2023-05-06 21:53:10','2023-05-06 21:53:10','2023-05-06 21:53:10','3209b83f-f143-4ace-85cb-3ccfefb28413'),(27,'craft','m221028_130548_add_canonical_id_index','2023-05-06 21:53:10','2023-05-06 21:53:10','2023-05-06 21:53:10','2a2aaeb9-4f05-4106-8ff9-06286d372e69'),(28,'craft','m221118_003031_drop_element_fks','2023-05-06 21:53:10','2023-05-06 21:53:10','2023-05-06 21:53:10','db8a53da-65b2-4128-a00b-85098ff2bde3'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2023-05-06 21:53:10','2023-05-06 21:53:10','2023-05-06 21:53:10','dd9c8a76-4705-4eaf-b6c4-34364e9c359c'),(30,'craft','m230226_013114_drop_plugin_license_columns','2023-05-06 21:53:10','2023-05-06 21:53:10','2023-05-06 21:53:10','bb670b7f-c820-4c64-9147-92dc1cf18907'),(31,'plugin:sprig','Install','2023-05-06 22:22:00','2023-05-06 22:22:00','2023-05-06 22:22:00','6e018817-4ae9-4e71-aeb1-0f3a5f079641');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'sprig','2.6.2','1.0.1','2023-05-06 22:22:00','2023-05-06 22:22:00','2023-05-06 22:22:00','6f64c90a-e2c3-4977-ae88-0e17cae78d19'),(2,'elements-panel','2.0.0','1.0.0','2023-05-06 22:22:03','2023-05-06 22:22:03','2023-05-06 22:22:03','e2e67193-459b-4483-b26a-469d1e4155c9');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1683481910'),('elementSources.craft\\elements\\Entry.0.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.0.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.0.disabled','false'),('elementSources.craft\\elements\\Entry.0.key','\"section:587357c8-2262-4666-9705-2f0b84385392\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.0','\"field:3a520d1b-b605-44aa-8200-d7784b974f5b\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.1','\"field:dcc6c87b-20a8-4fc8-847d-51fd4e86314d\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.1.disabled','false'),('elementSources.craft\\elements\\Entry.1.key','\"section:7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes','\"-\"'),('elementSources.craft\\elements\\Entry.1.type','\"native\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.2.disabled','false'),('elementSources.craft\\elements\\Entry.2.key','\"*\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.0','\"section\"'),('elementSources.craft\\elements\\Entry.2.type','\"native\"'),('email.fromEmail','\"info@domain.com\"'),('email.fromName','\"Craft Coding Challenge\"'),('email.replyToEmail','null'),('email.template','\"\"'),('email.transportSettings.command','\"/usr/sbin/sendmail -bs\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elementCondition','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.autocapitalize','true'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.autocomplete','false'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.autocorrect','true'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.class','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.disabled','false'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.elementCondition','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.id','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.instructions','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.label','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.max','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.min','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.name','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.orientation','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.placeholder','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.readonly','false'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.requirable','false'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.size','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.step','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.tip','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.title','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.uid','\"1a02f706-2b60-4ec1-9a77-96a5d82a53b0\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.userCondition','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.warning','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.0.width','100'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.1.elementCondition','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.1.fieldUid','\"3a520d1b-b605-44aa-8200-d7784b974f5b\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.1.instructions','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.1.label','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.1.required','false'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.1.tip','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.1.uid','\"19c0af6a-f83f-4a70-acbf-7d665a802d29\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.1.userCondition','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.1.warning','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.1.width','100'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.2.elementCondition','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.2.fieldUid','\"dcc6c87b-20a8-4fc8-847d-51fd4e86314d\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.2.instructions','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.2.label','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.2.required','false'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.2.tip','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.2.uid','\"995e02b1-8b8b-45df-b690-5c9b38be1961\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.2.userCondition','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.2.warning','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.elements.2.width','100'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.name','\"Content\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.uid','\"79539452-eba4-496b-882a-05e6b85a8053\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.fieldLayouts.ee5f7ff2-062f-494b-a8fc-ed8cb12eecfd.tabs.0.userCondition','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.handle','\"default\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.hasTitleField','true'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.name','\"Default\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.section','\"587357c8-2262-4666-9705-2f0b84385392\"'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.sortOrder','1'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.titleFormat','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.titleTranslationKeyFormat','null'),('entryTypes.95c24f9a-1f75-4390-bcb0-338dec4c5d6e.titleTranslationMethod','\"site\"'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elementCondition','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.autocapitalize','true'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.autocomplete','false'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.autocorrect','true'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.class','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.disabled','false'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.elementCondition','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.id','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.instructions','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.label','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.max','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.min','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.name','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.orientation','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.placeholder','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.readonly','false'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.requirable','false'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.size','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.step','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.tip','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.title','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.uid','\"4601beac-0a71-44be-bd63-228970ab069a\"'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.userCondition','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.warning','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.elements.0.width','100'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.name','\"Content\"'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.uid','\"4ff4e5ba-78ab-47b9-b0d4-fc3c18e59d22\"'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.fieldLayouts.f08c4615-4348-49aa-8eeb-6023970fffc1.tabs.0.userCondition','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.handle','\"default\"'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.hasTitleField','true'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.name','\"Default\"'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.section','\"7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b\"'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.sortOrder','1'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.titleFormat','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.titleTranslationKeyFormat','null'),('entryTypes.bf91aaf1-1e7d-46e2-b008-347b1922d419.titleTranslationMethod','\"site\"'),('fieldGroups.31006d4c-2f40-498c-9a4c-69cff4fd4279.name','\"Common\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.columnSuffix','null'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.contentColumnType','\"string\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.fieldGroup','\"31006d4c-2f40-498c-9a4c-69cff4fd4279\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.handle','\"tags\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.instructions','\"Up to weighted 5 tags that describe the destination. The first tag gets the most weight and the last tag gets the least weight.\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.name','\"Tags\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.searchable','false'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.allowSelfRelations','false'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.branchLimit','null'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.localizeRelations','false'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.maintainHierarchy','false'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.maxRelations','5'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.minRelations','1'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Entry\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.selectionLabel','\"Add a tag\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.showSiteMenu','true'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.sources.0','\"section:7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.targetSiteId','null'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.validateRelatedElements','false'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.settings.viewMode','null'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.translationKeyFormat','null'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.translationMethod','\"site\"'),('fields.3a520d1b-b605-44aa-8200-d7784b974f5b.type','\"craft\\\\fields\\\\Entries\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.columnSuffix','null'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.contentColumnType','\"string\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.fieldGroup','\"31006d4c-2f40-498c-9a4c-69cff4fd4279\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.handle','\"images\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.instructions','\"One or more images of the destination. Only the first image should be displayed in a “top recommendation”.\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.name','\"Images\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.searchable','false'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.allowedKinds.0','\"image\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.allowSelfRelations','false'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.allowSubfolders','false'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.allowUploads','true'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.branchLimit','null'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.defaultUploadLocationSource','\"volume:bdc98c9f-a066-45ba-89bd-6b5a5da7ae74\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.defaultUploadLocationSubpath','null'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.localizeRelations','false'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.maintainHierarchy','false'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.maxRelations','null'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.minRelations','1'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.previewMode','\"full\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.restrictedDefaultUploadSubpath','null'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.restrictedLocationSource','\"volume:bdc98c9f-a066-45ba-89bd-6b5a5da7ae74\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.restrictedLocationSubpath','null'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.restrictFiles','true'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.restrictLocation','true'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.selectionLabel','\"Add an image\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.showSiteMenu','true'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.showUnpermittedFiles','false'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.showUnpermittedVolumes','false'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.sources.0','\"volume:bdc98c9f-a066-45ba-89bd-6b5a5da7ae74\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.targetSiteId','null'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.validateRelatedElements','false'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.settings.viewMode','\"list\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.translationKeyFormat','null'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.translationMethod','\"site\"'),('fields.dcc6c87b-20a8-4fc8-847d-51fd4e86314d.type','\"craft\\\\fields\\\\Assets\"'),('fs.images.hasUrls','true'),('fs.images.name','\"Images\"'),('fs.images.settings.path','\"@webroot/assets/images\"'),('fs.images.type','\"craft\\\\fs\\\\Local\"'),('fs.images.url','\"/assets/images\"'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('imageTransforms.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8.fill','null'),('imageTransforms.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8.format','null'),('imageTransforms.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8.handle','\"small\"'),('imageTransforms.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8.height','200'),('imageTransforms.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8.interlace','\"none\"'),('imageTransforms.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8.mode','\"crop\"'),('imageTransforms.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8.name','\"Small\"'),('imageTransforms.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8.position','\"center-center\"'),('imageTransforms.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8.quality','null'),('imageTransforms.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8.upscale','true'),('imageTransforms.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8.width','350'),('imageTransforms.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3.fill','null'),('imageTransforms.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3.format','null'),('imageTransforms.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3.handle','\"large\"'),('imageTransforms.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3.height','700'),('imageTransforms.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3.interlace','\"none\"'),('imageTransforms.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3.mode','\"crop\"'),('imageTransforms.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3.name','\"Large\"'),('imageTransforms.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3.position','\"center-center\"'),('imageTransforms.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3.quality','null'),('imageTransforms.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3.upscale','true'),('imageTransforms.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3.width','1200'),('meta.__names__.0779f354-f5d2-4f82-9a36-28a252f70ce4','\"Public Schema\"'),('meta.__names__.0d89c679-f6f5-42ae-8341-4bea917c6af7','\"$CRAFT_SITE_NAME\"'),('meta.__names__.31006d4c-2f40-498c-9a4c-69cff4fd4279','\"Common\"'),('meta.__names__.3a520d1b-b605-44aa-8200-d7784b974f5b','\"Tags\"'),('meta.__names__.587357c8-2262-4666-9705-2f0b84385392','\"Destinations\"'),('meta.__names__.7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b','\"Tags\"'),('meta.__names__.858c43d9-04c3-4a37-865f-ff5ad2d4e8e8','\"Small\"'),('meta.__names__.95c24f9a-1f75-4390-bcb0-338dec4c5d6e','\"Default\"'),('meta.__names__.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74','\"Images\"'),('meta.__names__.bf91aaf1-1e7d-46e2-b008-347b1922d419','\"Default\"'),('meta.__names__.c77a98f6-d4a2-4935-a4cf-201a26cbe8c3','\"Large\"'),('meta.__names__.c7c2807b-84cc-4e1f-9279-af044bc0b472','\"Public Schema\"'),('meta.__names__.dcc6c87b-20a8-4fc8-847d-51fd4e86314d','\"Images\"'),('meta.__names__.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6','\"$CRAFT_SITE_NAME\"'),('plugins.elements-panel.edition','\"standard\"'),('plugins.elements-panel.enabled','true'),('plugins.elements-panel.schemaVersion','\"1.0.0\"'),('plugins.sprig.edition','\"standard\"'),('plugins.sprig.enabled','true'),('plugins.sprig.schemaVersion','\"1.0.1\"'),('sections.587357c8-2262-4666-9705-2f0b84385392.defaultPlacement','\"end\"'),('sections.587357c8-2262-4666-9705-2f0b84385392.enableVersioning','true'),('sections.587357c8-2262-4666-9705-2f0b84385392.handle','\"destinations\"'),('sections.587357c8-2262-4666-9705-2f0b84385392.name','\"Destinations\"'),('sections.587357c8-2262-4666-9705-2f0b84385392.propagationMethod','\"all\"'),('sections.587357c8-2262-4666-9705-2f0b84385392.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.enabledByDefault','true'),('sections.587357c8-2262-4666-9705-2f0b84385392.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.hasUrls','false'),('sections.587357c8-2262-4666-9705-2f0b84385392.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.template','null'),('sections.587357c8-2262-4666-9705-2f0b84385392.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.uriFormat','null'),('sections.587357c8-2262-4666-9705-2f0b84385392.type','\"channel\"'),('sections.7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b.defaultPlacement','\"end\"'),('sections.7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b.enableVersioning','true'),('sections.7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b.handle','\"tags\"'),('sections.7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b.name','\"Tags\"'),('sections.7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b.propagationMethod','\"all\"'),('sections.7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.enabledByDefault','true'),('sections.7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.hasUrls','false'),('sections.7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.template','null'),('sections.7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.uriFormat','null'),('sections.7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b.type','\"channel\"'),('siteGroups.0d89c679-f6f5-42ae-8341-4bea917c6af7.name','\"$CRAFT_SITE_NAME\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.enabled','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.handle','\"default\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.hasUrls','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.language','\"en-US\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.name','\"$CRAFT_SITE_NAME\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.primary','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.siteGroup','\"0d89c679-f6f5-42ae-8341-4bea917c6af7\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"$CRAFT_SITE_NAME\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.4.0.4\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elementCondition','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.0.elementCondition','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.0.fieldUid','\"4a74e36f-904e-4c5f-aafe-04db0a6fe71f\"'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.0.instructions','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.0.label','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.0.required','false'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.0.tip','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.0.uid','\"65552c99-e03e-4325-8ae1-7842d1e20c91\"'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.0.userCondition','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.0.warning','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.0.width','100'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.1.elementCondition','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.1.fieldUid','\"649c9c5a-c95e-489d-9c06-8df52e628f93\"'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.1.instructions','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.1.label','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.1.required','false'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.1.tip','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.1.uid','\"4bc1c352-6843-429d-b811-c6f740d26297\"'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.1.userCondition','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.1.warning','null'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.elements.1.width','100'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.name','\"Content\"'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.uid','\"d4d39176-6fae-4bf2-804f-b03e0be329f1\"'),('users.fieldLayouts.efa3e201-3541-4f47-8e71-0c3af28af042.tabs.0.userCondition','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elementCondition','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.autocapitalize','true'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.autocomplete','false'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.autocorrect','true'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.class','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.disabled','false'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.elementCondition','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.id','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.instructions','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.label','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.max','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.min','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.name','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.orientation','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.placeholder','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.readonly','false'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.requirable','false'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.size','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.step','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.tip','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.title','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.uid','\"1e751d34-d70c-4713-a2f7-cf941e0548ce\"'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.userCondition','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.warning','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.elements.0.width','100'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.name','\"Content\"'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.uid','\"1df019a3-392a-44f3-809b-3ae70c1a8a87\"'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fieldLayouts.ac14f975-fb51-483c-a01c-a84d207221b8.tabs.0.userCondition','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.fs','\"images\"'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.handle','\"images\"'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.name','\"Images\"'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.sortOrder','1'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.titleTranslationKeyFormat','null'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.titleTranslationMethod','\"site\"'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.transformFs','\"\"'),('volumes.bdc98c9f-a066-45ba-89bd-6b5a5da7ae74.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (2,2,2,NULL,9,1,'2023-05-06 22:14:51','2023-05-06 22:15:40','11faacec-71bc-4b1c-b402-bdbbf6ccc85d'),(4,2,2,NULL,37,2,'2023-05-06 22:15:36','2023-05-06 22:15:42','ebd78920-2354-4b54-9cb9-4e0ad18a146b'),(5,2,2,NULL,31,3,'2023-05-06 22:15:44','2023-05-06 22:15:44','a3b73ac5-a95b-4762-b1c0-7403d7b9525b'),(8,2,44,NULL,9,1,'2023-05-06 22:16:30','2023-05-06 22:16:30','47a4e211-6c0d-4b6d-ba43-1c5b394b8728'),(9,2,44,NULL,37,2,'2023-05-06 22:16:30','2023-05-06 22:16:30','e1d41274-4c98-492a-b642-bc40d6f915f2'),(10,2,44,NULL,31,3,'2023-05-06 22:16:30','2023-05-06 22:16:30','7a96003d-747b-4252-a52a-1e23cd5a397b'),(11,1,44,NULL,42,1,'2023-05-06 22:16:30','2023-05-06 22:16:30','82eda474-7ed6-4b07-9403-bdc2b683fbf5'),(12,1,44,NULL,43,2,'2023-05-06 22:16:30','2023-05-06 22:16:30','90374ac8-cb91-48c3-af3f-00279c39ce8e'),(20,2,47,NULL,9,1,'2023-05-06 22:16:41','2023-05-06 22:16:41','d2771297-c506-42fa-b50a-20ecf0a70a32'),(21,2,47,NULL,37,2,'2023-05-06 22:16:41','2023-05-06 22:16:41','5bb207ca-4980-4aad-b5a1-50b3942e581a'),(22,2,47,NULL,31,3,'2023-05-06 22:16:41','2023-05-06 22:16:41','ef1f78c5-80bc-4ab2-9df2-a992cf8ae1c9'),(23,1,47,NULL,42,1,'2023-05-06 22:16:41','2023-05-06 22:16:41','3f116651-b920-4cb1-b288-7cab1ef380c5'),(24,1,47,NULL,43,2,'2023-05-06 22:16:41','2023-05-06 22:16:41','531c4ed8-7893-4a28-a529-dba4b0400ede'),(25,1,47,NULL,45,3,'2023-05-06 22:16:41','2023-05-06 22:16:41','233fb047-d213-491a-bb1a-7587b75e64a4'),(26,2,48,NULL,51,2,'2023-05-06 23:16:53','2023-05-06 23:16:55','1d008d5f-7bd5-4c9c-a67a-379074421e58'),(27,2,48,NULL,49,1,'2023-05-06 23:16:53','2023-05-06 23:16:55','25957bfd-820a-45c8-9c26-5d75149e509a'),(28,2,48,NULL,37,3,'2023-05-06 23:16:53','2023-05-06 23:16:53','2b80cdce-bb89-47dd-93cc-e2d838ef01f4'),(29,2,48,NULL,5,4,'2023-05-06 23:16:53','2023-05-06 23:16:53','2af6e682-2523-4170-9957-23f59aad6786'),(30,1,48,NULL,54,2,'2023-05-06 23:19:25','2023-05-06 23:19:27','c7d65cf0-7bc1-443c-b8d9-fbab8cbe7d14'),(31,1,48,NULL,55,3,'2023-05-06 23:19:25','2023-05-06 23:19:27','5ac13114-19d3-4d9c-a36f-26777e093f73'),(32,1,48,NULL,53,1,'2023-05-06 23:19:25','2023-05-06 23:19:27','ddde12c3-ae42-408c-abd8-97211a7949c6'),(33,2,56,NULL,49,1,'2023-05-06 23:19:30','2023-05-06 23:19:30','6bac7f73-aec0-4e83-b016-56b1f95af417'),(34,2,56,NULL,51,2,'2023-05-06 23:19:30','2023-05-06 23:19:30','4341a514-6615-4a2f-b0e2-2bb111e2e449'),(35,2,56,NULL,37,3,'2023-05-06 23:19:30','2023-05-06 23:19:30','5c413080-2580-425a-8476-135e7ae8617e'),(36,2,56,NULL,5,4,'2023-05-06 23:19:30','2023-05-06 23:19:30','6118edf7-b4d5-4bb2-ab85-c3f8138176eb'),(37,1,56,NULL,53,1,'2023-05-06 23:19:30','2023-05-06 23:19:30','cfc95062-54de-41e6-95ab-546e5a446896'),(38,1,56,NULL,54,2,'2023-05-06 23:19:30','2023-05-06 23:19:30','8b27d790-d2c6-4410-92fa-5c9907c70add'),(39,1,56,NULL,55,3,'2023-05-06 23:19:30','2023-05-06 23:19:30','383516e5-0893-4249-b871-1e4564393875'),(46,1,2,NULL,39,1,'2023-05-06 23:19:55','2023-05-06 23:19:55','e775d364-94dc-48b0-aedf-ea84f6005eab'),(47,1,2,NULL,40,2,'2023-05-06 23:19:55','2023-05-06 23:19:55','1605ec70-1f62-4b26-ad91-b8aef5e1454a'),(48,1,2,NULL,41,3,'2023-05-06 23:19:55','2023-05-06 23:19:55','504d7cca-fca6-4b3f-87c1-62f3195b5b3b'),(49,2,58,NULL,9,1,'2023-05-06 23:19:55','2023-05-06 23:19:55','77f20782-e2cf-4b65-9f49-832d01612f75'),(50,2,58,NULL,37,2,'2023-05-06 23:19:55','2023-05-06 23:19:55','e755761a-5891-4896-84de-0ac7a628edd2'),(51,2,58,NULL,31,3,'2023-05-06 23:19:55','2023-05-06 23:19:55','685c4ef5-2555-4e56-b121-d9cc9ec10f6c'),(52,1,58,NULL,39,1,'2023-05-06 23:19:55','2023-05-06 23:19:55','5eaf5620-dcc3-402f-b9e3-2ed43e13fca9'),(53,1,58,NULL,40,2,'2023-05-06 23:19:55','2023-05-06 23:19:55','e82279a3-4978-466c-8961-15c805f6382f'),(54,1,58,NULL,41,3,'2023-05-06 23:19:55','2023-05-06 23:19:55','af496037-2584-4c32-a198-d0ebe85e9747'),(62,2,60,NULL,49,1,'2023-05-06 23:20:37','2023-05-06 23:20:37','6b21e3df-92e9-47e7-96b8-804559bbdf32'),(63,2,60,NULL,51,2,'2023-05-06 23:20:37','2023-05-06 23:20:37','cc490851-d44e-46c5-add4-b56517160667'),(64,2,60,NULL,37,3,'2023-05-06 23:20:37','2023-05-06 23:20:37','fe7c9c76-a453-406a-9ca0-533f55212d07'),(65,2,60,NULL,5,4,'2023-05-06 23:20:37','2023-05-06 23:20:37','61f2c4af-80a5-4285-bc9e-047d97c9be0d'),(66,1,60,NULL,53,1,'2023-05-06 23:20:37','2023-05-06 23:20:37','563c5043-0200-428e-98bc-30fdf4da4033'),(67,1,60,NULL,54,2,'2023-05-06 23:20:37','2023-05-06 23:20:37','fd50d6be-3a76-4db5-b3fd-3fdfa6e8ff57'),(68,1,60,NULL,55,3,'2023-05-06 23:20:37','2023-05-06 23:20:37','e47f46c2-5b3e-4555-acbf-26309e71640f'),(72,2,61,NULL,37,2,'2023-05-07 00:28:52','2023-05-07 00:28:54','399b014f-3434-41af-9044-cd955e2450f2'),(73,2,61,NULL,23,3,'2023-05-07 00:28:52','2023-05-07 00:28:54','8c16f851-d430-4601-b2b9-4c3a7e088605'),(74,2,61,NULL,19,1,'2023-05-07 00:28:52','2023-05-07 00:28:54','2fa5f5dc-785d-4832-ab09-4c614f5e4f4c'),(75,2,61,NULL,5,4,'2023-05-07 00:28:52','2023-05-07 00:28:52','ad7f85a3-772d-4f29-a589-f6789bfa45cb'),(76,1,61,NULL,63,2,'2023-05-07 00:29:11','2023-05-07 00:29:13','4c9a2d38-8148-4444-b234-48def6755134'),(77,1,61,NULL,64,3,'2023-05-07 00:29:11','2023-05-07 00:29:13','90d448e5-c497-449f-aadd-498c07c92bb1'),(78,1,61,NULL,62,1,'2023-05-07 00:29:11','2023-05-07 00:29:13','bb7182f5-ca98-487e-9705-7e8b1dc15b38'),(79,2,65,NULL,19,1,'2023-05-07 00:29:15','2023-05-07 00:29:15','dbcf1602-9a54-4f03-a973-dcab7b673113'),(80,2,65,NULL,37,2,'2023-05-07 00:29:15','2023-05-07 00:29:15','3772fc61-b0e3-499c-9da6-ab9de53d25f0'),(81,2,65,NULL,23,3,'2023-05-07 00:29:15','2023-05-07 00:29:15','04b81c4f-b7d9-4948-b72a-aaa7f9898185'),(82,2,65,NULL,5,4,'2023-05-07 00:29:15','2023-05-07 00:29:15','59c83e37-982b-4606-b1d8-06f04ffbd208'),(83,1,65,NULL,62,1,'2023-05-07 00:29:15','2023-05-07 00:29:15','de198e89-1251-4a13-a731-80eb6414f4f6'),(84,1,65,NULL,63,2,'2023-05-07 00:29:15','2023-05-07 00:29:15','1954b4c5-3b37-4f86-b9c5-2fd9956e14ae'),(85,1,65,NULL,64,3,'2023-05-07 00:29:15','2023-05-07 00:29:15','1b29b02c-18b2-448a-98cf-1e5ecad4b791'),(88,2,66,NULL,19,2,'2023-05-07 01:13:46','2023-05-07 01:13:50','1cab848e-5bdb-4a3a-9111-bd1fd3f61c90'),(89,2,66,NULL,17,3,'2023-05-07 01:13:46','2023-05-07 01:13:50','ec3fc491-3612-4c9a-8fc4-15a86ae38110'),(90,2,66,NULL,15,1,'2023-05-07 01:13:46','2023-05-07 01:13:50','df03e29d-2f0d-4128-8fdc-24977094fb73'),(92,1,66,NULL,69,2,'2023-05-07 01:13:59','2023-05-07 01:14:01','fa690a54-18f7-4163-8335-16a861e52655'),(93,1,66,NULL,67,3,'2023-05-07 01:13:59','2023-05-07 01:14:01','79772009-df1b-434a-bfdb-60f9b2f0ce54'),(94,1,66,NULL,68,1,'2023-05-07 01:13:59','2023-05-07 01:14:01','1425ca89-dee1-441f-a989-991d5c30b683'),(95,2,70,NULL,15,1,'2023-05-07 01:14:04','2023-05-07 01:14:04','f70d72b1-a90c-4447-afab-0d9c84f08410'),(96,2,70,NULL,19,2,'2023-05-07 01:14:04','2023-05-07 01:14:04','cc7bbbe4-ae11-45e4-ba97-2ffeb59ae413'),(97,2,70,NULL,17,3,'2023-05-07 01:14:04','2023-05-07 01:14:04','3ce85316-d6ef-4df9-99bc-abef2c875b81'),(98,2,70,NULL,3,4,'2023-05-07 01:14:04','2023-05-07 01:14:04','a8a9690b-2a3d-4497-a903-c79a4e552ba2'),(99,1,70,NULL,68,1,'2023-05-07 01:14:04','2023-05-07 01:14:04','6eda654e-4f48-4640-91da-10edfebac76b'),(100,1,70,NULL,69,2,'2023-05-07 01:14:04','2023-05-07 01:14:04','4ad4f64d-b69c-4787-a560-2c8dcf4a973d'),(101,1,70,NULL,67,3,'2023-05-07 01:14:04','2023-05-07 01:14:04','dcaa8ea7-cccc-4694-b0d1-2c6debc72d35'),(110,2,72,NULL,15,1,'2023-05-07 14:07:41','2023-05-07 14:07:41','a694465e-d2b3-4851-852e-ae048ce59f43'),(111,2,72,NULL,19,2,'2023-05-07 14:07:41','2023-05-07 14:07:41','832b9ff6-1a5a-4eb2-8177-3a8e8b963d06'),(112,2,72,NULL,17,3,'2023-05-07 14:07:41','2023-05-07 14:07:41','9c0e91cf-ddeb-4646-b326-cca8a33363ae'),(113,2,72,NULL,3,4,'2023-05-07 14:07:41','2023-05-07 14:07:41','ea2e3d71-870a-4b54-99bc-e6a2b371c70c'),(114,1,72,NULL,68,1,'2023-05-07 14:07:41','2023-05-07 14:07:41','35fcb028-a7ea-4725-b964-fb6c0e82c4b8'),(115,1,72,NULL,69,2,'2023-05-07 14:07:41','2023-05-07 14:07:41','a8cded6e-4b3d-4b2d-a5b0-13db9fc5a874'),(116,1,72,NULL,67,3,'2023-05-07 14:07:41','2023-05-07 14:07:41','0cbffcad-068d-4bc5-93c7-3bff8f82b758'),(117,2,73,NULL,17,2,'2023-05-07 14:13:22','2023-05-07 14:13:24','023be297-a39a-4eab-840c-9de11322f317'),(118,2,73,NULL,15,1,'2023-05-07 14:13:22','2023-05-07 14:13:24','1d59ef99-3822-471d-983b-a5950ae9b6e0'),(119,2,73,NULL,51,3,'2023-05-07 14:13:35','2023-05-07 14:13:35','5f5bf2c1-ef96-4784-87cc-3837b946d820'),(120,1,73,NULL,76,3,'2023-05-07 14:15:34','2023-05-07 14:15:36','6c072e07-da43-46e6-a2a0-1781074be7dd'),(121,1,73,NULL,74,1,'2023-05-07 14:15:34','2023-05-07 14:15:36','3d4c6fed-1bb5-4da2-8ab4-7c2f7a0fb1a0'),(122,1,73,NULL,75,2,'2023-05-07 14:15:34','2023-05-07 14:15:36','90f02050-f45d-4ca9-a5d1-041de31c43b2'),(123,2,77,NULL,15,1,'2023-05-07 14:15:39','2023-05-07 14:15:39','35d381cd-8765-453a-8572-653595fe7057'),(124,2,77,NULL,17,2,'2023-05-07 14:15:39','2023-05-07 14:15:39','6fc50bf4-7e8d-4ba3-9ce8-c35c06342231'),(125,2,77,NULL,51,3,'2023-05-07 14:15:39','2023-05-07 14:15:39','51ccedc8-2518-4b43-90c1-bb7eb2649c97'),(126,1,77,NULL,74,1,'2023-05-07 14:15:39','2023-05-07 14:15:39','a0dee62d-5b31-4730-af08-8e5eeef6fa39'),(127,1,77,NULL,75,2,'2023-05-07 14:15:39','2023-05-07 14:15:39','1c2169c0-bf16-4c0a-b553-b788687a48fc'),(128,1,77,NULL,76,3,'2023-05-07 14:15:39','2023-05-07 14:15:39','e019c75b-6a88-4670-badf-cba9c5206c88'),(129,2,78,NULL,15,1,'2023-05-07 14:16:26','2023-05-07 14:16:26','127a14ed-9286-42e3-98c1-24f5b5983e8f'),(130,2,78,NULL,17,2,'2023-05-07 14:16:31','2023-05-07 14:16:31','0526a830-f56a-45b4-aae6-54bfe62883f9'),(131,2,78,NULL,51,3,'2023-05-07 14:16:36','2023-05-07 14:16:36','b1fc076a-4f26-45a4-a865-52a0f1ab2325'),(132,2,78,NULL,11,4,'2023-05-07 14:16:41','2023-05-07 14:16:41','ffd00f28-ac7d-4169-8ad7-ea01e95c3358'),(133,1,78,NULL,80,1,'2023-05-07 14:17:54','2023-05-07 14:17:54','24630b9e-4055-41cb-8b48-c5559db6aa99'),(134,1,78,NULL,81,3,'2023-05-07 14:17:54','2023-05-07 14:17:56','d5b087ec-647d-4880-9c25-a099b6b6f54c'),(135,1,78,NULL,79,2,'2023-05-07 14:17:54','2023-05-07 14:17:56','a0c50c94-383d-4ba2-981b-20cb806d98b1'),(136,2,82,NULL,15,1,'2023-05-07 14:17:58','2023-05-07 14:17:58','3a0c8579-8568-4ba6-b653-b2a2d5965204'),(137,2,82,NULL,17,2,'2023-05-07 14:17:58','2023-05-07 14:17:58','449bb186-30bf-42bd-b824-0f24e4547f5d'),(138,2,82,NULL,51,3,'2023-05-07 14:17:58','2023-05-07 14:17:58','8cc375db-fbc1-475e-9c07-d2e97430a569'),(139,2,82,NULL,11,4,'2023-05-07 14:17:58','2023-05-07 14:17:58','fb4034f9-5287-417f-bccf-aa7ff1e44385'),(140,1,82,NULL,80,1,'2023-05-07 14:17:58','2023-05-07 14:17:58','e35861ad-9af8-49cf-a06f-2fae9c68817e'),(141,1,82,NULL,79,2,'2023-05-07 14:17:58','2023-05-07 14:17:58','3bb5a682-9ce6-4070-b635-7710035c4759'),(142,1,82,NULL,81,3,'2023-05-07 14:17:58','2023-05-07 14:17:58','e85815da-8a4b-4c37-a085-f5b2d53ce0d5'),(143,2,83,NULL,13,3,'2023-05-07 14:20:30','2023-05-07 14:25:11','7851238f-1356-4b05-ae01-1497f7ee00c4'),(144,2,83,NULL,51,4,'2023-05-07 14:20:35','2023-05-07 14:25:11','bf0b213f-10b9-46f6-a5c8-eed16c5411b2'),(145,1,83,NULL,84,1,'2023-05-07 14:20:54','2023-05-07 14:20:54','9baffa11-759d-4278-ac86-e73d7feb7fea'),(146,2,85,NULL,13,1,'2023-05-07 14:20:55','2023-05-07 14:20:55','1724f303-3b48-4368-b799-1809895124f8'),(147,2,85,NULL,51,2,'2023-05-07 14:20:55','2023-05-07 14:20:55','395eccd8-3d8b-40c4-b300-69985b773d25'),(148,1,85,NULL,84,1,'2023-05-07 14:20:55','2023-05-07 14:20:55','fa847183-dcf7-48af-8aa9-c18afdc82c81'),(153,2,83,NULL,25,2,'2023-05-07 14:21:22','2023-05-07 14:25:11','3081c977-f969-41a5-9fe7-ad930ebe94e7'),(154,2,87,NULL,25,1,'2023-05-07 14:21:22','2023-05-07 14:21:22','2b33c04f-cd80-4d74-9577-ad125ab49f3a'),(155,2,87,NULL,13,2,'2023-05-07 14:21:22','2023-05-07 14:21:22','ee62af33-8cdf-457c-b59f-47ac3665c855'),(156,2,87,NULL,51,3,'2023-05-07 14:21:22','2023-05-07 14:21:22','b42a5c1a-f6f1-43db-b116-50bddeada35d'),(157,1,87,NULL,84,1,'2023-05-07 14:21:22','2023-05-07 14:21:22','7a94de27-1c8e-4f2e-b299-1d6f2c9b3492'),(158,2,88,NULL,27,3,'2023-05-07 14:22:36','2023-05-07 14:22:40','7a186e2b-eb95-4f77-859a-72717acb20b1'),(159,2,88,NULL,25,2,'2023-05-07 14:22:36','2023-05-07 14:22:40','45de8505-f03c-4e1b-a8c5-20b6770d8556'),(160,2,88,NULL,3,1,'2023-05-07 14:22:36','2023-05-07 14:22:38','b0e42ccc-98db-4a53-bb3d-dfe2a892ebeb'),(161,1,88,NULL,89,1,'2023-05-07 14:23:12','2023-05-07 14:23:12','adcb62a4-8bae-414c-aad7-6b655382bea8'),(162,2,90,NULL,3,1,'2023-05-07 14:23:13','2023-05-07 14:23:13','dd7752a3-53cb-46c7-865c-43b95567a468'),(163,2,90,NULL,25,2,'2023-05-07 14:23:13','2023-05-07 14:23:13','146d558f-f43e-46d4-997b-331c3d843cd2'),(164,2,90,NULL,27,3,'2023-05-07 14:23:13','2023-05-07 14:23:13','26c22e71-db7f-43ec-bd20-63c56f69e060'),(165,1,90,NULL,89,1,'2023-05-07 14:23:13','2023-05-07 14:23:13','34759e5e-0a20-4ecd-a96b-12f938066ea1'),(166,2,91,NULL,3,2,'2023-05-07 14:24:13','2023-05-07 14:24:31','ca749c21-b121-46bf-8752-fb24f01d15f0'),(167,2,91,NULL,25,3,'2023-05-07 14:24:19','2023-05-07 14:24:31','2ce726ea-5831-47f3-97a2-a43932ada284'),(168,2,91,NULL,92,1,'2023-05-07 14:24:28','2023-05-07 14:24:31','0108f643-8258-426a-a33a-8628c2bde8c4'),(169,1,91,NULL,94,1,'2023-05-07 14:24:57','2023-05-07 14:24:57','663e79fc-4fca-4ada-a472-b1bccc8ec679'),(170,2,95,NULL,92,1,'2023-05-07 14:24:59','2023-05-07 14:24:59','fd76597b-76c0-4a0f-a653-87c3e1800b6e'),(171,2,95,NULL,3,2,'2023-05-07 14:24:59','2023-05-07 14:24:59','f1eeb857-8b28-4876-998f-b32d703cfa36'),(172,2,95,NULL,25,3,'2023-05-07 14:24:59','2023-05-07 14:24:59','085f7026-4743-42ac-98a7-eb1751dae848'),(173,1,95,NULL,94,1,'2023-05-07 14:24:59','2023-05-07 14:24:59','df98fe18-9830-4dc8-94dd-a7bea5d578aa'),(179,2,83,NULL,92,1,'2023-05-07 14:25:11','2023-05-07 14:25:11','e8f6b22c-4551-4565-9415-24a059ac15a4'),(180,2,97,NULL,92,1,'2023-05-07 14:25:11','2023-05-07 14:25:11','ead7f8ba-676a-4047-aa89-faa152e800f9'),(181,2,97,NULL,25,2,'2023-05-07 14:25:11','2023-05-07 14:25:11','10c4944c-8b49-4120-a69c-8898de459fdc'),(182,2,97,NULL,13,3,'2023-05-07 14:25:11','2023-05-07 14:25:11','1c2a2016-8405-4f71-85db-0f6fa78202c0'),(183,2,97,NULL,51,4,'2023-05-07 14:25:11','2023-05-07 14:25:11','3e712e0a-7b0d-4960-9361-3430d514ad85'),(184,1,97,NULL,84,1,'2023-05-07 14:25:11','2023-05-07 14:25:11','d869a001-0dd5-42de-87a4-a6e39a93f79d'),(192,2,73,NULL,92,4,'2023-05-07 14:25:18','2023-05-07 14:25:18','63869077-575d-4668-b373-44fcc31ca52c'),(193,2,99,NULL,15,1,'2023-05-07 14:25:18','2023-05-07 14:25:18','242c1369-a07a-4421-9dfb-cba00a4edfb8'),(194,2,99,NULL,17,2,'2023-05-07 14:25:18','2023-05-07 14:25:18','40452a5a-237a-4e48-bc0d-ccb3e4826c08'),(195,2,99,NULL,51,3,'2023-05-07 14:25:18','2023-05-07 14:25:18','d18f1fa7-9dbc-4278-8f13-7d160f42afc8'),(196,2,99,NULL,92,4,'2023-05-07 14:25:18','2023-05-07 14:25:18','85973291-7bba-42e4-b645-8bcd2de852ed'),(197,1,99,NULL,74,1,'2023-05-07 14:25:18','2023-05-07 14:25:18','0999a063-ed52-4d89-b8fb-f961524917d5'),(198,1,99,NULL,75,2,'2023-05-07 14:25:18','2023-05-07 14:25:18','0c1251a1-dda4-4cf6-bbf4-58b6965fb777'),(199,1,99,NULL,76,3,'2023-05-07 14:25:18','2023-05-07 14:25:18','0aa82997-fb07-42d8-b0f1-eea85c8e3676'),(208,2,66,NULL,92,4,'2023-05-07 14:25:29','2023-05-07 14:25:29','a95b3ffe-3916-45bc-94fc-ca6ffd8a0f18'),(209,2,101,NULL,15,1,'2023-05-07 14:25:29','2023-05-07 14:25:29','04170a31-1602-4a2f-a7c8-fcfd160cb636'),(210,2,101,NULL,19,2,'2023-05-07 14:25:29','2023-05-07 14:25:29','ae4759f6-cd66-4425-8c07-acea45678173'),(211,2,101,NULL,17,3,'2023-05-07 14:25:29','2023-05-07 14:25:29','d6d27a5b-af5f-4690-bc9b-7227c6bbb911'),(212,2,101,NULL,92,4,'2023-05-07 14:25:29','2023-05-07 14:25:29','51beb15d-632e-4e21-b8b5-89306aae5f77'),(213,1,101,NULL,68,1,'2023-05-07 14:25:29','2023-05-07 14:25:29','425b0ecf-4a94-4a00-a9d7-c42b4b8afb28'),(214,1,101,NULL,69,2,'2023-05-07 14:25:29','2023-05-07 14:25:29','22b427d8-1f69-4b2c-bf9f-c22db6dbf630'),(215,1,101,NULL,67,3,'2023-05-07 14:25:29','2023-05-07 14:25:29','0afcf994-75b8-450f-bbb8-458331a2e463'),(216,2,102,NULL,15,1,'2023-05-07 14:27:27','2023-05-07 14:27:27','7f54adda-3a5c-465c-98fd-f85a1fc858fe'),(217,2,102,NULL,17,2,'2023-05-07 14:27:33','2023-05-07 14:27:33','81bad335-5049-445e-b4d1-d185e0563123'),(218,1,102,NULL,103,1,'2023-05-07 14:28:05','2023-05-07 14:28:05','d901d605-a462-425a-99be-077757591cb5'),(219,2,104,NULL,15,1,'2023-05-07 14:28:06','2023-05-07 14:28:06','e2fb86fe-75ce-4776-bba1-692626d1431b'),(220,2,104,NULL,17,2,'2023-05-07 14:28:06','2023-05-07 14:28:06','57181e39-c509-49e6-9387-4d2defb0eeaa'),(221,1,104,NULL,103,1,'2023-05-07 14:28:06','2023-05-07 14:28:06','e45448c9-a2f5-486b-b2ed-88589d8870bf'),(222,2,105,NULL,35,1,'2023-05-07 14:29:21','2023-05-07 14:29:21','c3a44c10-1132-4c13-a30c-78b30ca6f642'),(223,2,105,NULL,49,2,'2023-05-07 14:29:23','2023-05-07 14:29:23','85f12280-b099-470b-aeb6-f2e97188f7c8'),(224,2,105,NULL,51,3,'2023-05-07 14:29:26','2023-05-07 14:29:26','496ed5ad-e526-4605-909f-cdb30d6afbd7'),(225,1,105,NULL,106,1,'2023-05-07 14:29:35','2023-05-07 14:29:35','f3f52894-a264-4a20-89fb-86e91853537e'),(226,2,107,NULL,35,1,'2023-05-07 14:29:36','2023-05-07 14:29:36','7512c2b1-89f9-40ea-bf52-9314a9da6be5'),(227,2,107,NULL,49,2,'2023-05-07 14:29:36','2023-05-07 14:29:36','63887408-0576-45a9-b59f-d09ad96be12a'),(228,2,107,NULL,51,3,'2023-05-07 14:29:36','2023-05-07 14:29:36','64eaacd4-5454-4513-8d81-5229fc1b14c7'),(229,1,107,NULL,106,1,'2023-05-07 14:29:36','2023-05-07 14:29:36','342a3abf-7ed3-4f68-b46d-311d5e95aebd'),(230,2,108,NULL,35,1,'2023-05-07 14:30:56','2023-05-07 14:30:56','a53bd11d-24a2-4b70-8c02-6e32e756a83f'),(231,2,108,NULL,25,2,'2023-05-07 14:31:00','2023-05-07 14:31:00','1a8b56a5-d0f3-470f-8192-0e4045810368'),(232,2,108,NULL,27,3,'2023-05-07 14:31:07','2023-05-07 14:31:07','00fb4c79-a0b5-4caa-90d5-0dc26a72f034'),(233,1,108,NULL,109,1,'2023-05-07 14:31:33','2023-05-07 14:31:33','6534fb4b-2401-4ecd-8ac0-bf8f39e1242f'),(234,2,110,NULL,35,1,'2023-05-07 14:31:34','2023-05-07 14:31:34','07a95f19-4b43-4bff-a5cd-8d0dccd3b81f'),(235,2,110,NULL,25,2,'2023-05-07 14:31:34','2023-05-07 14:31:34','067706d1-ceb5-42e5-8f63-6b4c4226cee5'),(236,2,110,NULL,27,3,'2023-05-07 14:31:34','2023-05-07 14:31:34','2a1bdd9a-1c75-4b7d-9abd-a4b661ad12a9'),(237,1,110,NULL,109,1,'2023-05-07 14:31:34','2023-05-07 14:31:34','d31ef4a6-4e56-4161-b2c6-cf35ad4744e9');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,3,1,1,''),(2,5,1,1,''),(3,7,1,1,''),(4,9,1,1,''),(5,11,1,1,''),(6,13,1,1,''),(7,15,1,1,''),(8,17,1,1,''),(9,19,1,1,''),(10,21,1,1,''),(11,23,1,1,''),(12,25,1,1,''),(13,27,1,1,''),(14,25,1,2,'Applied “Draft 1”'),(15,31,1,1,''),(16,31,1,2,'Applied “Draft 1”'),(17,35,1,1,''),(18,37,1,1,''),(19,2,1,1,''),(20,2,1,2,'Applied “Draft 1”'),(21,49,1,1,''),(22,51,1,1,''),(23,48,1,1,''),(24,2,1,3,'Applied “Draft 1”'),(25,48,1,2,'Applied “Draft 1”'),(26,61,1,1,''),(27,66,1,1,''),(28,66,1,2,'Applied “Draft 1”'),(29,73,1,1,''),(30,78,1,1,''),(31,83,1,1,''),(32,83,1,2,'Applied “Draft 1”'),(33,88,1,1,''),(34,92,1,1,''),(35,91,1,1,''),(36,83,1,3,'Applied “Draft 1”'),(37,73,1,2,'Applied “Draft 1”'),(38,66,1,3,'Applied “Draft 1”'),(39,102,1,1,''),(40,105,1,1,''),(41,108,1,1,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' info putyourlightson com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' bacalar lagoon mexico '),(2,'title',0,1,' bacalar lagoon mexico '),(3,'slug',0,1,' mountains '),(3,'title',0,1,' mountains '),(5,'slug',0,1,' jungle '),(5,'title',0,1,' jungle '),(7,'slug',0,1,' forest '),(7,'title',0,1,' forest '),(9,'slug',0,1,' lake '),(9,'title',0,1,' lake '),(11,'slug',0,1,' river '),(11,'title',0,1,' river '),(13,'slug',0,1,' countryside '),(13,'title',0,1,' countryside '),(15,'slug',0,1,' city '),(15,'title',0,1,' city '),(17,'slug',0,1,' nightlife '),(17,'title',0,1,' nightlife '),(19,'slug',0,1,' beach '),(19,'title',0,1,' beach '),(21,'slug',0,1,' party '),(21,'title',0,1,' party '),(23,'slug',0,1,' retreat '),(23,'title',0,1,' retreat '),(25,'slug',0,1,' outdoor activities '),(25,'title',0,1,' outdoor activities '),(27,'slug',0,1,' extreme sports '),(27,'title',0,1,' extreme sports '),(31,'slug',0,1,' water sports '),(31,'title',0,1,' water sports '),(35,'slug',0,1,' desert '),(35,'title',0,1,' desert '),(37,'slug',0,1,' tropical '),(37,'title',0,1,' tropical '),(39,'alt',0,1,''),(39,'extension',0,1,' jpg '),(39,'filename',0,1,' bacalar 1 jpg '),(39,'kind',0,1,' image '),(39,'slug',0,1,''),(39,'title',0,1,' bacalar 1 '),(40,'alt',0,1,''),(40,'extension',0,1,' jpg '),(40,'filename',0,1,' bacalar 2 jpg '),(40,'kind',0,1,' image '),(40,'slug',0,1,''),(40,'title',0,1,' bacalar 2 '),(41,'alt',0,1,''),(41,'extension',0,1,' jpg '),(41,'filename',0,1,' bacalar 3 jpg '),(41,'kind',0,1,' image '),(41,'slug',0,1,''),(41,'title',0,1,' bacalar 3 '),(42,'alt',0,1,''),(42,'extension',0,1,' jpg '),(42,'filename',0,1,' bacalar 1 2023 05 06 221621 nyvf jpg '),(42,'kind',0,1,' image '),(42,'slug',0,1,''),(42,'title',0,1,' bacalar 1 '),(43,'alt',0,1,''),(43,'extension',0,1,' jpg '),(43,'filename',0,1,' bacalar 2 2023 05 06 221622 ksen jpg '),(43,'kind',0,1,' image '),(43,'slug',0,1,''),(43,'title',0,1,' bacalar 2 '),(45,'alt',0,1,''),(45,'extension',0,1,' jpg '),(45,'filename',0,1,' bacalar 3 2023 05 06 221636 lvvh jpg '),(45,'kind',0,1,' image '),(45,'slug',0,1,''),(45,'title',0,1,' bacalar 3 '),(48,'slug',0,1,' chichen itza mexico '),(48,'title',0,1,' chichen itza mexico '),(49,'slug',0,1,' ruins '),(49,'title',0,1,' ruins '),(51,'slug',0,1,' historic '),(51,'title',0,1,' historic '),(53,'alt',0,1,''),(53,'extension',0,1,' jpg '),(53,'filename',0,1,' chichen itza 1 jpg '),(53,'kind',0,1,' image '),(53,'slug',0,1,''),(53,'title',0,1,' chichen itza 1 '),(54,'alt',0,1,''),(54,'extension',0,1,' jpg '),(54,'filename',0,1,' chichen itza 2 jpg '),(54,'kind',0,1,' image '),(54,'slug',0,1,''),(54,'title',0,1,' chichen itza 2 '),(55,'alt',0,1,''),(55,'extension',0,1,' jpg '),(55,'filename',0,1,' chichen itza 3 jpg '),(55,'kind',0,1,' image '),(55,'slug',0,1,''),(55,'title',0,1,' chichen itza 3 '),(61,'slug',0,1,' uvita costa rica '),(61,'title',0,1,' uvita costa rica '),(62,'alt',0,1,''),(62,'extension',0,1,' jpg '),(62,'filename',0,1,' uvita 1 jpg '),(62,'kind',0,1,' image '),(62,'slug',0,1,''),(62,'title',0,1,' uvita 1 '),(63,'alt',0,1,''),(63,'extension',0,1,' jpg '),(63,'filename',0,1,' uvita 2 jpg '),(63,'kind',0,1,' image '),(63,'slug',0,1,''),(63,'title',0,1,' uvita 2 '),(64,'alt',0,1,''),(64,'extension',0,1,' jpg '),(64,'filename',0,1,' uvita 3 jpg '),(64,'kind',0,1,' image '),(64,'slug',0,1,''),(64,'title',0,1,' uvita 3 '),(66,'slug',0,1,' rio de janeiro brazil '),(66,'title',0,1,' rio de janeiro brazil '),(67,'alt',0,1,''),(67,'extension',0,1,' jpg '),(67,'filename',0,1,' rio de janeiro 3 jpg '),(67,'kind',0,1,' image '),(67,'slug',0,1,''),(67,'title',0,1,' rio de janeiro 3 '),(68,'alt',0,1,''),(68,'extension',0,1,' jpg '),(68,'filename',0,1,' rio de janeiro 1 jpg '),(68,'kind',0,1,' image '),(68,'slug',0,1,''),(68,'title',0,1,' rio de janeiro 1 '),(69,'alt',0,1,''),(69,'extension',0,1,' jpg '),(69,'filename',0,1,' rio de janeiro 2 jpg '),(69,'kind',0,1,' image '),(69,'slug',0,1,''),(69,'title',0,1,' rio de janeiro 2 '),(73,'slug',0,1,' barcelona spain '),(73,'title',0,1,' barcelona spain '),(74,'alt',0,1,''),(74,'extension',0,1,' jpg '),(74,'filename',0,1,' barcelona 1 jpg '),(74,'kind',0,1,' image '),(74,'slug',0,1,''),(74,'title',0,1,' barcelona 1 '),(75,'alt',0,1,''),(75,'extension',0,1,' jpg '),(75,'filename',0,1,' barcelona 2 jpg '),(75,'kind',0,1,' image '),(75,'slug',0,1,''),(75,'title',0,1,' barcelona 2 '),(76,'alt',0,1,''),(76,'extension',0,1,' jpg '),(76,'filename',0,1,' barcelona 3 jpg '),(76,'kind',0,1,' image '),(76,'slug',0,1,''),(76,'title',0,1,' barcelona 3 '),(78,'slug',0,1,' london united kingdom '),(78,'title',0,1,' london united kingdom '),(79,'alt',0,1,''),(79,'extension',0,1,' jpg '),(79,'filename',0,1,' london 2 jpg '),(79,'kind',0,1,' image '),(79,'slug',0,1,''),(79,'title',0,1,' london 2 '),(80,'alt',0,1,''),(80,'extension',0,1,' jpg '),(80,'filename',0,1,' london 1 jpg '),(80,'kind',0,1,' image '),(80,'slug',0,1,''),(80,'title',0,1,' london 1 '),(81,'alt',0,1,''),(81,'extension',0,1,' jpg '),(81,'filename',0,1,' london 3 jpg '),(81,'kind',0,1,' image '),(81,'slug',0,1,''),(81,'title',0,1,' london 3 '),(83,'slug',0,1,' the burren ireland '),(83,'title',0,1,' the burren ireland '),(84,'alt',0,1,''),(84,'extension',0,1,' jpg '),(84,'filename',0,1,' the burren jpg '),(84,'kind',0,1,' image '),(84,'slug',0,1,''),(84,'title',0,1,' the burren '),(88,'slug',0,1,' sankt gilgen austria '),(88,'title',0,1,' sankt gilgen austria '),(89,'alt',0,1,''),(89,'extension',0,1,' jpg '),(89,'filename',0,1,' austria jpg '),(89,'kind',0,1,' image '),(89,'slug',0,1,''),(89,'title',0,1,' austria '),(91,'slug',0,1,' lofoten norway '),(91,'title',0,1,' lofoten norway '),(92,'slug',0,1,' sea '),(92,'title',0,1,' sea '),(94,'alt',0,1,''),(94,'extension',0,1,' jpg '),(94,'filename',0,1,' lofoten jpg '),(94,'kind',0,1,' image '),(94,'slug',0,1,''),(94,'title',0,1,' lofoten '),(102,'slug',0,1,' tokyo japan '),(102,'title',0,1,' tokyo japan '),(103,'alt',0,1,''),(103,'extension',0,1,' jpg '),(103,'filename',0,1,' tokyo jpg '),(103,'kind',0,1,' image '),(103,'slug',0,1,''),(103,'title',0,1,' tokyo '),(105,'slug',0,1,' petra jordan '),(105,'title',0,1,' petra jordan '),(106,'alt',0,1,''),(106,'extension',0,1,' jpg '),(106,'filename',0,1,' petra jpg '),(106,'kind',0,1,' image '),(106,'slug',0,1,''),(106,'title',0,1,' petra '),(108,'slug',0,1,' kings canyon australia '),(108,'title',0,1,' kings canyon australia '),(109,'alt',0,1,''),(109,'extension',0,1,' jpg '),(109,'filename',0,1,' kings canyon jpg '),(109,'kind',0,1,' image '),(109,'slug',0,1,''),(109,'title',0,1,' kings canyon ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Destinations','destinations','channel',1,'all','end',NULL,'2023-05-06 22:04:13','2023-05-06 22:04:13',NULL,'587357c8-2262-4666-9705-2f0b84385392'),(2,NULL,'Tags','tags','channel',1,'all','end',NULL,'2023-05-06 22:04:29','2023-05-06 22:04:29',NULL,'7ecb6c5b-40bf-4fc0-a015-5367a2e9d85b');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,0,NULL,NULL,1,'2023-05-06 22:04:13','2023-05-06 22:04:13','3a88080c-946b-462a-ac54-d9234ef72abe'),(2,2,1,0,NULL,NULL,1,'2023-05-06 22:04:29','2023-05-06 22:04:29','00847635-8a4d-4a21-9ea4-a610fc5700b5');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'$CRAFT_SITE_NAME','2023-02-02 05:28:23','2023-02-02 20:38:11',NULL,'0d89c679-f6f5-42ae-8341-4bea917c6af7');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','$CRAFT_SITE_NAME','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-02-02 05:28:23','2023-02-02 20:37:47',NULL,'f255ef6d-0c55-4bdc-9ced-f610bbb3bed6');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sprig_playgrounds`
--

LOCK TABLES `sprig_playgrounds` WRITE;
/*!40000 ALTER TABLE `sprig_playgrounds` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sprig_playgrounds` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin','',NULL,NULL,'info@putyourlightson.com','$2y$13$crqJ.kzM.kBs.WsWGUxT9uUdR4Imi./d9prVKVya/MkWu/Bd/8.Ga','2023-05-07 14:05:46',NULL,NULL,NULL,'2023-02-02 05:28:58',NULL,1,NULL,NULL,NULL,0,'2023-02-02 05:28:24','2023-02-02 05:28:24','2023-05-07 14:05:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images','','2023-05-06 22:02:28','2023-05-06 22:02:28','d9e137f5-e4a6-488e-a49f-6a54dcd80dba'),(2,NULL,NULL,'Temporary filesystem',NULL,'2023-05-06 22:06:19','2023-05-06 22:06:19','dba37d38-4254-4366-8095-32db267a447d'),(3,2,NULL,'user_1','user_1/','2023-05-06 22:06:19','2023-05-06 22:06:19','79b5b3b9-7b51-45ff-b12c-48b719b5aa4e');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,1,'Images','images','images','','','site',NULL,1,'2023-05-06 22:02:28','2023-05-06 22:02:28',NULL,'bdc98c9f-a066-45ba-89bd-6b5a5da7ae74');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','c53fbd79-71b8-4d8f-8c28-79fa730418d5'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','0882d0b5-810a-4e9e-adcc-3c52d35c6cee'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','b306bd06-fcad-4702-9075-fae37ad18291'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','70fc0edf-2bdd-4a72-ae90-5e6bb14e89d8');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-07 17:54:32
